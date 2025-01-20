import 'package:meta/meta.dart';
import 'dart:convert';

class ProductModel {
    final DateTime the1;
    final String the3;
    final String dsa;
    final String hello;

    ProductModel({
        required this.the1,
        required this.the3,
        required this.dsa,
        required this.hello,
    });

    ProductModel copyWith({
        DateTime? the1,
        String? the3,
        String? dsa,
        String? hello,
    }) => 
        ProductModel(
            the1: the1 ?? this.the1,
            the3: the3 ?? this.the3,
            dsa: dsa ?? this.dsa,
            hello: hello ?? this.hello,
        );

    factory ProductModel.fromJson(String str) => ProductModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        the1: DateTime.parse(json["1"]),
        the3: json["\$\$3"],
        dsa: json["#!_dsa"],
        hello: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "1": the1.toIso8601String(),
        "\u0024\u00243": the3,
        "#!_dsa": dsa,
        "id": hello,
    };
}