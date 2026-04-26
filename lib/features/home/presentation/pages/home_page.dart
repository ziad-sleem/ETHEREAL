import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/widgets/app_footer.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_circle_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/director_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/discover_film_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/selected_for_you_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getAllCategories()
        ..getProducts(),
      child: Scaffold(
        appBar: AppBar(title: AppLogo()),
        body: BlocBuilder<HomeCubit, HomeState>(
          // Only rebuild the entire scroll view if categories change (needed for Tab length)
          buildWhen: (prev, curr) =>
              prev.categoriesState.data?.length !=
              curr.categoriesState.data?.length,
          builder: (context, state) {
            final categories = state.categoriesState.data ?? [];

            if (state.categoriesState.isLoading && categories.isEmpty) {
              return const Center(child: AppLoader());
            }

            return DefaultTabController(
              length: categories.isEmpty ? 1 : categories.length,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    // 1. Editorial Sections (Semi-Static)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headerTextWidget("Search"),
                            const SizedBox(height: 8),
                            TextField(
                              controller: searchController,
                              style: TextStyle(
                                fontFamily: 'Podkova',
                                fontSize: 18,
                                color: theme.primary,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Explore The Collection...",
                              ),
                            ),
                            const SizedBox(height: 24),
                            headerTextWidget("Categories"),
                          ],
                        ),
                      ),
                    ),

                    // 2. Categories Horizontal List (Scoped Rebuild)
                    SliverToBoxAdapter(
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (prev, curr) =>
                            prev.categoriesState != curr.categoriesState,
                        builder: (context, state) {
                          final cats = state.categoriesState.data ?? [];
                          return SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              itemCount: cats.length,
                              itemBuilder: (context, index) =>
                                  CategoryCircleWidget(category: cats[index]),
                            ),
                          );
                        },
                      ),
                    ),

                    // 3. Pinned TabBar (Sync with Body)
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      toolbarHeight: 40,
                      automaticallyImplyLeading: false,
                      backgroundColor: theme.surface,
                      surfaceTintColor: Colors.transparent,
                      title: headerTextWidget("Products"),
                      centerTitle: false,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(48),
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          indicatorColor: const Color(0xFF8C6D34),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: const Color(0xFF8C6D34),
                          unselectedLabelColor: Colors.grey.shade500,
                          labelStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                          tabs: categories
                              .map((c) => Tab(text: c.name.toUpperCase()))
                              .toList(),
                        ),
                      ),
                    ),
                  ];
                },
                // 4. Products View (Scoped Rebuild)
                body: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (prev, curr) =>
                      prev.productsState != curr.productsState,
                  builder: (context, state) {
                    final products = state.productsState.data ?? [];
                    if (state.productsState.isLoading && products.isEmpty) {
                      return const Center(child: AppLoader());
                    }

                    return TabBarView(
                      children: _buildCategoryTabs(categories, products),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildCategoryTabs(
    List<CategoryEntity> categories,
    List<ProductEntity> allProducts,
  ) {
    if (categories.isEmpty) return [const SizedBox.shrink()];

    return categories.map((category) {
      final productByCategory = _filterCategory(category, allProducts);
      return CustomScrollView(
        key: PageStorageKey(category.name),
        slivers: [
          if (productByCategory.isEmpty)
            const SliverFillRemaining(
              child: Center(child: AppText(text: 'No products here')),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      ProductWidget(product: productByCategory[index]),
                  childCount: productByCategory.length,
                ),
              ),
            ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: SizedBox(height: 10),
            ),
          ),
          const SliverToBoxAdapter(child: DiscoverFilmWidget()),
          const SliverToBoxAdapter(child: DirectorWidget()),
          SliverToBoxAdapter(
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final products = state.productsState.data ?? [];
                if (state.productsState.isLoading || products.isEmpty) {
                  return const SizedBox.shrink();
                }
                return SelectedForYouWidget(products: products);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(height: 30),
            ),
          ),

          const SliverToBoxAdapter(child: AppFooter()),
        ],
      );
    }).toList();
  }

  Widget headerTextWidget(String text) {
    return AppText(
      text: text,
      textAlign: TextAlign.start,
      textSize: 18,
      textWeight: FontWeight.bold,
    );
  }
}

final TextEditingController searchController = TextEditingController();

List<ProductEntity> _filterCategory(
  CategoryEntity category,
  List<ProductEntity> allProducts,
) {
  return allProducts.where((product) {
    final categories = product.categories as List<dynamic>?;
    return categories?.contains(category.name) ?? false;
  }).toList();
}
