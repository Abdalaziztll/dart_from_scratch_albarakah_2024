import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:state_managment_bloc/bloc/my_products_bloc.dart';
import 'package:state_managment_bloc/service/product_service.dart';

GetIt sl = GetIt.instance;

setup() {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ProductService>(ProductService(dio: sl.get<Dio>()));
  sl.registerFactory<MyProductsBloc>(() => MyProductsBloc(productService: sl.get<ProductService>()));
}
