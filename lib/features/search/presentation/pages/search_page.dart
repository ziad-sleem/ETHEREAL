import 'package:e_commerce/config/di/di.dart';
import 'package:e_commerce/core/widgets/app_logo.dart';
import 'package:e_commerce/core/widgets/loading_widget.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_widget.dart';
import 'package:e_commerce/features/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) {
      context.read<SearchBloc>().add(FetchProducts());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchBloc>()..add(FetchProducts()),
      child: Builder(
        builder: (context) {
          // Listen to scroll events to trigger pagination
          _scrollController.addListener(() => _onScroll(context));

          final theme = Theme.of(context);
          return Scaffold(
            appBar: AppBar(title: AppLogo()),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Hero(
                    tag: 'search_tag',
                    child: Material(
                      type: MaterialType.transparency,
                      child: TextField(
                        autofocus: true,
                        controller: _searchController,
                        onChanged: (value) {
                          context.read<SearchBloc>().add(
                            SearchQueryChanged(value),
                          );
                        },
                        style: TextStyle(color: theme.colorScheme.primary),
                        decoration: const InputDecoration(
                          hintText: "Explore The Collection...",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state.status == SearchStatus.initial ||
                          (state.status == SearchStatus.loading &&
                              state.products.isEmpty)) {
                        return const Center(child: AppLoader());
                      }
                      if (state.status == SearchStatus.failure &&
                          state.products.isEmpty) {
                        return Center(
                          child: Text(
                            state.errorMessage.isNotEmpty
                                ? state.errorMessage
                                : "Failed to load products",
                          ),
                        );
                      }

                      final products = state.filteredProducts;

                      if (products.isEmpty) {
                        return const Center(child: Text("No products found"));
                      }

                      return GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.65,
                            ),
                        itemCount: state.hasReachedMax
                            ? products.length
                            : products.length + 1,
                        itemBuilder: (context, index) {
                          if (index >= products.length) {
                            return const Center(child: AppLoader());
                          }
                          return ProductWidget(product: products[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
