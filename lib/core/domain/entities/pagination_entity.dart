import 'package:equatable/equatable.dart';

class PaginationEntity<T> extends Equatable {
  final List<T> items;
  final int page;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  const PaginationEntity({
    required this.items,
    required this.page,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  @override
  List<Object?> get props => [
        items,
        page,
        pageSize,
        totalCount,
        hasNextPage,
        hasPreviousPage,
      ];
}
