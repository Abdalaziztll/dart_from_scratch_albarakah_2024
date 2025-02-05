// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Repo {
  Dio dio ;
  String baseurlProduct = "https://dummyjson.com/products";
  String baseurlAuth = "https://dummyjson.com/auth/login";
  late Response response;
  Repo({
    required this.dio,
  });
}
