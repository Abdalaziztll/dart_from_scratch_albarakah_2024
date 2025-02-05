import 'package:app_manager_bloc_app/model/product_model.dart';
import 'package:app_manager_bloc_app/repo/product_repo.dart';

class ProductService extends ProductRepo {
  ProductService({required super.dio});

  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      response = await dio.get(baseurlProduct);
      return List.generate(
        response.data['products'].length,
        (index) => ProductModel.fromMap(response.data['products'][index]),
      );
    } catch (e) {
      print(e);
      return [];
    }
  }
}
