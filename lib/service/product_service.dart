// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_state_management/model/hanlde_modal.dart';
import 'package:bloc_state_management/model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  Dio dio;
  ProductService({
    required this.dio,
  });

  late Response response;
  String baseUrl = "https://www.freetestapi.com/api/v1/products/1";

  Future<ResultModel> getOneProduct() async {
    try {
      response = await dio.get(baseUrl);
      return ProductModel.fromMap(response.data);
    } catch (e) {
      print(e);
      return HandleModel(message: e.toString());
    }
  }
}
