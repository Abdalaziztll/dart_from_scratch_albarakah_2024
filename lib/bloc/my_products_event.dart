// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_products_bloc.dart';

@immutable
sealed class MyProductsEvent {}

class GetAllProduct extends MyProductsEvent {}

class LikeOneProduct extends MyProductsEvent {
  ProductModel productModel;
  LikeOneProduct({
    required this.productModel,
  });
}


class DisLikeOneProduct extends MyProductsEvent {
  num id;
  DisLikeOneProduct({
    required this.id,
  });
}

class RemoveAll extends MyProductsEvent {}

class GetMyFavorite extends MyProductsEvent {}