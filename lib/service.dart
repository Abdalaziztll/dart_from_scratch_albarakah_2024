import 'package:dio/dio.dart';
import 'package:restfullapi/models.dart';
import 'package:restfullapi/user_model.dart';

Future<Todo?> getOneData() async {
  Dio request = Dio();

  try {
    Response response =
        await request.get("https://jsonplaceholder.typicode.com/todos/1");

    Todo todo = Todo.fromMap(response.data);
    return todo;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<List<Todo>> getAllData() async {
  Dio request = Dio();

  try {
    Response respone =
        await request.get("https://jsonplaceholder.typicode.com/todos/0");

    List<Todo> todos = [];
    for (var i = 0; i < respone.data.length; i++) {
      Todo todo = Todo.fromMap(respone.data[i]);
      todos.add(todo);
    }
    return todos;
  } catch (e) {
    print(e);
    return [];
  }
}

Future<UserModel> getOneUserData() async {
  Dio request = Dio();

  Response response =
      await request.get("https://jsonplaceholder.typicode.com/users/1");

  UserModel user = UserModel.fromMap(response.data);
  return user;
}
