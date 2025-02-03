// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductEntity {
  num id;
  String name;
  String description;
  String image;
  bool isFav;
  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.isFav,
  });

  ProductEntity copyWith({
    num? id,
    String? name,
    String? description,
    String? image,
    bool? isFav,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      isFav: isFav ?? this.isFav,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'isFav': isFav,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] as num,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      isFav: map['isFav'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductEntity.fromJson(String source) =>
      ProductEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductEntity(id: $id, name: $name, description: $description, image: $image, isFav: $isFav)';
  }

  @override
  bool operator ==(covariant ProductEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.isFav == isFav;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      image.hashCode ^
      isFav.hashCode;
  }
}
