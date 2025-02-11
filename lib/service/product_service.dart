import 'package:tdd_and_mocking/model/product_model.dart';
import 'package:tdd_and_mocking/service/base_service.dart';

abstract class ProductService extends CoreService {
  ProductService({required super.dio});

  Future<ProductModel> getProduct();
}

class ProductServiceImp extends ProductService {
  ProductServiceImp({required super.dio});

  @override
  Future<ProductModel> getProduct() async {
    try {
      response = await dio.get(baseUrl);
      return ProductModel.fromMap(response.data);
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
