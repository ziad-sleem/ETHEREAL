import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<int> {
  ProductDetailsCubit() : super(1);

  void increment(int maxStock) {
    if (state < maxStock) {
      emit(state + 1);
    }
  }

  void decrement() {
    if (state > 1) {
      emit(state - 1);
    }
  }
}
