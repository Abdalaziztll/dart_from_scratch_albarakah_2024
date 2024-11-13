// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pizza {
  Ingradian ingradian;

  Pizza({required this.ingradian});
  order() {
    print(
        "Cooking the ingradint ${ingradian.cheese} - ${ingradian.olive} - ${ingradian.onion}");
  }
}

class Ingradian {
  int onion;
  int olive;
  int cheese;

  Ingradian({required this.cheese, required this.olive, required this.onion});

  @override
  String toString() {
    return "onion ${onion}  _  olive : ${olive}  _ cheese : ${cheese}";
  }

  // @override
  // bool operator ==(covariant Ingradian other) {
  //   if (identical(this, other)) return true;

  //   return
  //     other.onion == onion &&
  //     other.olive == olive &&
  //     other.cheese == cheese;
  // }

  // @override
  // int get hashCode => onion.hashCode ^ olive.hashCode ^ cheese.hashCode;
}

// ? Singltone Class Design Pattern
class Human {
  String name;
  Human._({
    required this.name,
  });

  static Human _human = Human._(name: "MHD");

  static Human getInstance() {
    return _human;
  }
}

class Product {
  String name;
  String id;
  double price;
  Product({
    required this.name,
    required this.id,
    required this.price,
  });

  toMap() {
    return {"name": name, "id": id, "price": price};
  }

  static fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] is String ? map['name'] : "Not Valid",
      id: map['id'] is String ? map['id'] : "-1",
      price: ((map['price'] is double) && (map['price'] > 0))
          ? map['price']
          : -1.0,
    );
  }
}
