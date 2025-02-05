import 'package:app_manager_bloc_app/model/product_model.dart';
import 'package:app_manager_bloc_app/repo/product_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepo productRepo;

  ProductBloc(this.productRepo) : super(ProductInitial()) {
    on<GetAllProduct>((event, emit) async {
      emit(LoadingProduct());
      List<ProductModel> result = await productRepo.getProduct();
      if (result.isEmpty) {
        emit(
          FailedToGetProduct(),
        );
      } else {
        emit(
          SuccessToGetProduct(
            products: result,
          ),
        );
      }
    });
  }
}
