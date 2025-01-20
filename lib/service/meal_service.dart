import 'package:dio/dio.dart';
import 'package:review_session/model/meal_model.dart';

class MealService {
  var dio = Dio();
  String baseUrl =
      "'ttps://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals'";
  late Response response;

  Future<MealModel> getMeal() async {
    try {
      var headers = {
        'token':
            'FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTY2ODc3MDQ3ZTA4MjRiY2FhMzM2OCIsImVtYWlsIjoiZmx1dHRlci50ZXN0OTl0ZXN0QGdtYWlsLmNvbSIsIm5hbWUiOiJheWExMjMiLCJpYXQiOjE3MTI4NjE2MzZ9.UmQvnqE0tTE7wgpXvEzvpIxlTel2GM6nLX6Qk4dNDnA'
      };
      response = await dio.get(
        baseUrl,
        options: Options(
          headers: headers,
        ),
      );
      return MealModel.fromMap(response.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
