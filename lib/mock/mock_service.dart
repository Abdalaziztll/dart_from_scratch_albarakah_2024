import 'package:mockito/mockito.dart';
import 'package:tdd_and_mocking/model/product_model.dart';
import 'package:tdd_and_mocking/service/product_service.dart';

class MockService extends Mock implements ProductService {
  @override
  Future<ProductModel> getProduct() async {
    return ProductModel.fromMap(
      {
        "name": "Apple",
        "price": "2000",
      },
    );
  }
}
