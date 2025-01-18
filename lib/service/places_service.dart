import 'package:dio/dio.dart';
import 'package:search_types/model/places_model.dart';

class PlacesService {
  Dio dio = Dio();
  String baseurl = "https://www.freetestapi.com/api/v1/destinations";
  late Response reposne;

  Future<List<PlacesModel>> getAllData() async {
    try {
      reposne = await dio.get(baseurl);
      return List.generate(
        reposne.data.length,
        (index) => PlacesModel.fromMap(reposne.data[index]),
      );
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<PlacesModel>> search({String lexem = ""}) async {
    try {
      reposne = await dio.get(baseurl + "?search=${lexem}");
      return List.generate(
        reposne.data.length,
        (index) => PlacesModel.fromMap(reposne.data[index]),
      );
    } catch (e) {
      print(e);
      return [];
    }
  }
}
