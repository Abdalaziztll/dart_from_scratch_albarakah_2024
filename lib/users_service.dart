import 'package:dio/dio.dart';
import 'package:restfullapi/users_model.dart';

String token = '';

Future<void> logIn({required UserModel user}) async {
  Dio req = Dio();
  try {
    Response response =
        await req.post('https://dummyjson.com/auth/login', data: user.toMap());
    print(response.data['accessToken']);
    token = response.data['accessToken'];
    print("SUCCESS");
  } catch (e) {
    print(e);
  }
}

Future<void> getMyInfo() async {
  Dio req = Dio();
  try {
    Response response = await req.get(
      'https://dummyjson.com/auth/me',
      options: Options(
        headers: {
          "Authorization": "Bearer ${token}",
        },
      ),
    );
    print(response.data);
  } catch (e) {
    print(e);
  }
}
