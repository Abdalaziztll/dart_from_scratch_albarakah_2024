import 'package:restfullapi/producs_model.dart';
import 'package:restfullapi/product_service.dart';
import 'package:restfullapi/users_model.dart';
import 'package:restfullapi/users_service.dart';

void main() async {
  // ! 3- https://dummyjson.com/products

  List<ProducsModel> products = await getAllProducts();

  List<String> list = List.generate(
    10,
    (index) {
      return "Hello ${index}";
    },
  );
  print(list);

  for (var element in products) {
    print(element.category);
    print("-----------------------------");
  }

  await logIn(user: UserModel(username: "emilys", password: "emilyspass"));
  await getMyInfo();

   // ! Decode and Encode 
   // ! Hashing
   // ! Encryption and Decryption
}
