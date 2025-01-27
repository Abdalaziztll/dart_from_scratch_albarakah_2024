import 'package:get_it/get_it.dart';
import 'package:state_managment_session/provider/product_provider.dart';

setup() {
  GetIt.instance.registerSingleton<ProductProvider>(ProductProvider());
}
