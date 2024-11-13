import 'package:intro_to_desing_pattern_and_serilization/intro_to_desing_pattern_and_serilization.dart';

void main() {
  Pizza fourSeason = Pizza(
    ingradian: Ingradian(
      cheese: 1,
      olive: 2,
      onion: 3,
    ),
  );

  fourSeason.order();

  int coutner = 0;
  print(coutner.toString());
  Ingradian ingradian = Ingradian(cheese: 20, olive: 20, onion: 30);
  print(ingradian);
  Ingradian ingradian2 = Ingradian(cheese: 20, olive: 20, onion: 30);
  print(ingradian2);

  if (ingradian == ingradian2) {
    print("Yes");
  } else {
    print("Noooooo");
  }

  Human human = Human.getInstance();
  human.name = "Rami";
  Human human2 = Human.getInstance();
  print(human2.name);

  if (human2 == human) {
    print("Yes");
  } else {
    print("No");
  }

  Product shirt = Product(name: "LC shirt", id: "1", price: 2000);
  Product Tshirt = Product(name: "LC T-shirt", id: "2", price: 3000);
  print(shirt.toMap());
  print(Tshirt.toMap());

  Product pants = Product.fromMap(
    {
      "name": true,
      "id": 2,
      "price": "-20",
    },
  );

  print(pants.toMap());
}
// ? JSON Serlization
// ? https://jsonplaceholder.typicode.com/posts/1
// ! https://jsonplaceholder.typicode.com/users/1