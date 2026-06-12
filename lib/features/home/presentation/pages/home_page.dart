import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/widgets/app_footer.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/app_text.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce/features/home/domain/entities/category_with_products.dart';
import 'package:e_commerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/widgets/category_circle_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/director_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/discover_film_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/selected_for_you_widget.dart';
import 'package:e_commerce/features/search/presentation/pages/search_page.dart';
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
        appBar: AppBar(
          title: AppLogo(),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              icon: Icon(Icons.shopping_bag_outlined, color: AppColors.primary),
            ),
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (prev, curr) =>
              prev.categoryTabs.length != curr.categoryTabs.length,
          builder: (context, state) {
            final tabs = state.categoryTabs;

            if (state.categoriesState.isLoading && tabs.isEmpty) {
              return const Center(child: AppLoader());
            }

            return DefaultTabController(
              length: tabs.isEmpty ? 1 : tabs.length,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headerTextWidget("Search"),
                            const SizedBox(height: 8),
                            Hero(
                              tag: 'search_tag',
                              child: Material(
                                type: MaterialType.transparency,
                                child: TextField(
                                  readOnly: true,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder:
                                            (context, animation, secondaryAnimation) =>
                                                const SearchPage(),
                                        transitionsBuilder:
                                            (context, animation, secondaryAnimation, child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                      ),
                                    );
                                  },
                                  style: const TextStyle(),
                                  decoration: const InputDecoration(
                                    hintText: "Explore The Collection...",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            headerTextWidget("Categories"),
                          ],
                        ),
                      ),
                    ),

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
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              itemCount: cats.length,
                              itemBuilder: (context, index) =>
                                  CategoryCircleWidget(category: cats[index]),
                            ),
                          );
                        },
                      ),
                    ),

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
                          tabs: tabs
                              .map((t) => Tab(text: t.category.name.toUpperCase()))
                              .toList(),
                        ),
                      ),
                    ),
                  ];
                },
                body: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (prev, curr) =>
                      prev.categoryTabs != curr.categoryTabs,
                  builder: (context, state) {
                    final tabs = state.categoryTabs;
                    if (state.productsState.isLoading && tabs.isEmpty) {
                      return const Center(child: AppLoader());
                    }

                    return TabBarView(
                      children: tabs.isEmpty
                          ? [const SizedBox.shrink()]
                          : tabs.map((tab) => _buildCategoryTab(tab)).toList(),
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

  Widget _buildCategoryTab(CategoryWithProducts tabData) {
    return CustomScrollView(
      key: PageStorageKey(tabData.category.name),
      slivers: [
        if (tabData.products.isEmpty)
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
                (context, index) => ProductWidget(
                  key: ValueKey(tabData.products[index].id),
                  product: tabData.products[index],
                ),
                childCount: tabData.products.length,
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
              final allProducts = state.productsState.data ?? [];
              if (state.productsState.isLoading || allProducts.isEmpty) {
                return const SizedBox.shrink();
              }
              return SelectedForYouWidget(products: allProducts);
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
