// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:state_managment_bloc/model/handling_model.dart';

import 'package:state_managment_bloc/model/product_entity.dart';
import 'package:state_managment_bloc/model/product_model.dart';
import 'package:state_managment_bloc/service/product_service.dart';

part 'my_products_event.dart';
part 'my_products_state.dart';

class MyProductsBloc extends Bloc<MyProductsEvent, MyProductsState> {
  List<ProductModel> products = [];
  List<ProductEntity> favorite = [];
      ResultModel result = ResultModel();

  ProductService productService;

  MyProductsBloc({required this.productService}) : super(MyProductsInitial()) {
    on<GetAllProduct>((event, emit) async {
      emit(LoadingState());
      result = await productService.getAllProduct();
      if (result is ListOfModels<ProductModel>) {
        emit(SuccessToGetProducts(products: (result  as ListOfModels<ProductModel> ).products));
      } else {
        emit(ErrorState());
      }
    });

    on<LikeOneProduct>(
      (event, emit) {
        favorite.add(
          ProductEntity(
            id: event.productModel.id,
            name: event.productModel.name,
            description: event.productModel.description,
            image: event.productModel.image,
            isFav: true,
          ),
        );
        emit(AddedToFavorite());
        emit(
          SuccessToGetProducts(
            products: (result  as ListOfModels<ProductModel>).products,
          ),
        );
      },
    );
    on<DisLikeOneProduct>(
      (event, emit) {
        favorite.removeWhere(
          (element) => element.id == event.id,
        );
        emit(RemovedFromFavorite());
        emit(SuccessToGetFavorite(favorite: favorite));
      },
    );

    on<GetMyFavorite>(
      (event, emit) {
        emit(
          SuccessToGetFavorite(
            favorite: favorite,
          ),
        );
      },
    );

    on<RemoveAll>(
      (event, emit) {
        favorite.clear();
        emit(RemoveAllSuccessfully());
      },
    );
  }
}
