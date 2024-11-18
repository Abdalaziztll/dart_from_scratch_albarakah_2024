import 'package:dio/dio.dart';
import 'package:restfullapi/producs_model.dart';

Future<List<ProducsModel>> getAllProducst() async {
  Dio req = Dio();

  Response response = await req.get("https://dummyjson.com/products");
  List<ProducsModel> producst = [];
  for (var i = 0; i < response.data['products'].length; i++) {
    ProducsModel producs = ProducsModel.fromMap(response.data['products'][i]);
    producst.add(producs);
  }
  return producst;
}

Future<List<ProducsModel>> getAllProducts() async {
  Dio req = Dio();

  Response response = await req.get("https://dummyjson.com/products");
  List<ProducsModel> producst = List.generate(
    response.data['products'].length,
    (index) => ProducsModel.fromMap(
      response.data['products'][index],
    ),
  );
  return producst;
}
