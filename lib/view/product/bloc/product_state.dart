// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class SuccessToFetch extends ProductState {
  final ProductModel product;
  SuccessToFetch({
    required this.product,
  });
}

class FailedState extends ProductState {
 final String message;
  FailedState({
    required this.message,
  });
}

class LoadingState extends ProductState {}
