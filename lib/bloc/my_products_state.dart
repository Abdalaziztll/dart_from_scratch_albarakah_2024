// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'my_products_bloc.dart';

@immutable
sealed class MyProductsState {}

final class MyProductsInitial extends MyProductsState {}

class AddedToFavorite extends MyProductsState {}

class RemovedFromFavorite extends MyProductsState {}

class RemoveAllSuccessfully extends MyProductsState {}

class SuccessToGetProducts extends MyProductsState {
  List<ProductModel> products;
  SuccessToGetProducts({
    required this.products,
  });
}

class SuccessToGetFavorite extends MyProductsState {
  List<ProductEntity> favorite;
  SuccessToGetFavorite({
    required this.favorite,
  });
}

class LoadingState extends MyProductsState {}

class ErrorState extends MyProductsState {}
