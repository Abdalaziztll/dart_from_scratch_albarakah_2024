// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class ProducsModel {
  int id;
  String title;
  String category;
  double price;
  num stock;
  List<String> tags;
  List<Reviews> reviews;
  ProducsModel({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.stock,
    required this.tags,
    required this.reviews,
  });

  ProducsModel copyWith({
    int? id,
    String? title,
    String? category,
    double? price,
    double? stock,
    List<String>? tags,
    List<Reviews>? reviews,
  }) {
    return ProducsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'stock': stock,
      'tags': tags,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory ProducsModel.fromMap(Map<String, dynamic> map) {
    return ProducsModel(
      id: map['id'] as int,
      title: map['title'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      stock: map['stock'] as num,
      tags: List.generate(map['tags'].length, (index) => map['tags'][index],),
      reviews: List<Reviews>.from((map['reviews'] as List<dynamic>).map<Reviews>((x) => Reviews.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProducsModel.fromJson(String source) => ProducsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProducsModel(id: $id, title: $title, category: $category, price: $price, stock: $stock, tags: $tags, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant ProducsModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return 
      other.id == id &&
      other.title == title &&
      other.category == category &&
      other.price == price &&
      other.stock == stock &&
      listEquals(other.tags, tags) &&
      listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      category.hashCode ^
      price.hashCode ^
      stock.hashCode ^
      tags.hashCode ^
      reviews.hashCode;
  }
}

class Reviews {
  int rating;
  String commnet;
  String date;
  String reviewerName;
  Reviews({
    required this.rating,
    required this.commnet,
    required this.date,
    required this.reviewerName,
  });

  Reviews copyWith({
    int? rating,
    String? commnet,
    String? date,
    String? reviewerName,
  }) {
    return Reviews(
      rating: rating ?? this.rating,
      commnet: commnet ?? this.commnet,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rating': rating,
      'commnet': commnet,
      'date': date,
      'reviewerName': reviewerName,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      rating: map['rating'] as int,
      commnet: map['comment'] as String,
      date: map['date'] as String,
      reviewerName: map['reviewerName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reviews(rating: $rating, commnet: $commnet, date: $date, reviewerName: $reviewerName)';
  }

  @override
  bool operator ==(covariant Reviews other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.commnet == commnet &&
        other.date == date &&
        other.reviewerName == reviewerName;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        commnet.hashCode ^
        date.hashCode ^
        reviewerName.hashCode;
  }
}
