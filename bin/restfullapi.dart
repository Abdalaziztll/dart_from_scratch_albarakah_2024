import 'package:restfullapi/service.dart';

void main() async {
  // ? 200 - 204 - 201 - 317 - 413 - 403 - 405 - 401 - 500 - 404
  // ? 1- https://www.freetestapi.com/api/v1/products/1

  // ? 2- https://dummyjson.com/products/category-list

  // ! 3- https://dummyjson.com/products
  print(
    (await getOneData(),),
  );

  print(
    (await getAllData()).elementAtOrNull(
      0,
    ),
  );

  print(
    (await getOneUserData()).address.geo.lng,
  );

  print(
    (await getOneUserData(),),
  );
}
