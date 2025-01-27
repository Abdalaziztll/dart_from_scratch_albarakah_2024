// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  String name;
  String price;
  String rating;
  String brand;
  ProductModel({
    required this.name,
    required this.price,
    required this.rating,
    required this.brand,
  });

  ProductModel copyWith({
    String? name,
    String? price,
    String? rating,
    String? brand,
  }) {
    return ProductModel(
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'rating': rating,
      'brand': brand,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      price: map['price'] as String,
      rating: map['rating'] as String,
      brand: map['brand'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(name: $name, price: $price, rating: $rating, brand: $brand)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.price == price &&
      other.rating == rating &&
      other.brand == brand;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      price.hashCode ^
      rating.hashCode ^
      brand.hashCode;
  }
}
