// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class CoreService {
  Dio dio;
  String baseUrl = "";
  late Response response;
  CoreService({
    required this.dio,
  });
}
