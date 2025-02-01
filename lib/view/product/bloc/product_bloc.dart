import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/model/hanlde_modal.dart';
import 'package:bloc_state_management/model/product_model.dart';
import 'package:bloc_state_management/service/product_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<FetchingProduct>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await ProductService(dio: Dio()).getOneProduct();
      if (result is ProductModel) {
        emit(SuccessToFetch(product: result));
      } else {
        emit(FailedState(message: (result as HandleModel).message));
      }
    });
  }
}
