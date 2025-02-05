import 'package:app_manager_bloc_app/model/product_model.dart';
import 'package:app_manager_bloc_app/repo/repo.dart';

abstract class ProductRepo extends Repo {
  ProductRepo({required super.dio});

Future<List<ProductModel>>  getProduct();
}
