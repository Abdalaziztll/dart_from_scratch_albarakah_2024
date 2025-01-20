import 'package:meta/meta.dart';
import 'dart:convert';

class MealModel {
    final String message;
    final List<Meal> meals;

    MealModel({
        required this.message,
        required this.meals,
    });

    MealModel copyWith({
        String? message,
        List<Meal>? meals,
    }) => 
        MealModel(
            message: message ?? this.message,
            meals: meals ?? this.meals,
        );

    factory MealModel.fromJson(String str) => MealModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MealModel.fromMap(Map<String, dynamic> json) => MealModel(
        message: json["message"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "meals": List<dynamic>.from(meals.map((x) => x.toMap())),
    };
}

class Meal {
    final String id;
    final String name;
    final String description;
    final int price;
    final String howToSell;
    final List<String> images;
    final String category;
    final String chefId;
    final String status;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    Meal({
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.howToSell,
        required this.images,
        required this.category,
        required this.chefId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    Meal copyWith({
        String? id,
        String? name,
        String? description,
        int? price,
        String? howToSell,
        List<String>? images,
        String? category,
        String? chefId,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? v,
    }) => 
        Meal(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            price: price ?? this.price,
            howToSell: howToSell ?? this.howToSell,
            images: images ?? this.images,
            category: category ?? this.category,
            chefId: chefId ?? this.chefId,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            v: v ?? this.v,
        );

    factory Meal.fromJson(String str) => Meal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meal.fromMap(Map<String, dynamic> json) => Meal(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        howToSell: json["howToSell"],
        images: List<String>.from(json["images"].map((x) => x)),
        category: json["category"],
        chefId: json["chefId"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "howToSell": howToSell,
        "images": List<dynamic>.from(images.map((x) => x)),
        "category": category,
        "chefId": chefId,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
