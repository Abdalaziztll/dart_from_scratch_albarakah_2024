// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:state_managment_bloc/model/handling_model.dart';
import 'package:state_managment_bloc/model/product_model.dart';

class ProductService {
  Dio dio;
  String baseUrl = "https://www.freetestapi.com/api/v1/products";
  late Response response;
  ProductService({
    required this.dio,
  });

  Future<ResultModel> getAllProduct() async {
    try {
      response = await dio.get(baseUrl);
      return ListOfModels<ProductModel>(
          products: List.generate(
        response.data.length,
        (index) => ProductModel.fromMap(response.data[index]),
      ));
    } catch (e) {
      print(e);
      return HandlingModel();
    }
  }
}
