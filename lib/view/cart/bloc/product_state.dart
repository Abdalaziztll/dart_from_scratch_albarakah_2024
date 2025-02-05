// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class SuccessToGetProduct extends ProductState {
final  List<ProductModel> products;
  SuccessToGetProduct({
    required this.products,
  });
}


class LoadingProduct extends ProductState {}

class  FailedToGetProduct extends ProductState {}