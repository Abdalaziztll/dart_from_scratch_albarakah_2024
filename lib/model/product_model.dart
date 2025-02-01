import 'dart:convert';

import 'package:bloc_state_management/model/hanlde_modal.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel extends ResultModel {
  String name;
  String description;
  String image;
  ProductModel({
    required this.name,
    required this.description,
    required this.image,
  });

  ProductModel copyWith({
    String? name,
    String? description,
    String? image,
  }) {
    return ProductModel(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductModel(name: $name, description: $description, image: $image)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.description == description &&
      other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode;
}
