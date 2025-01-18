import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlacesModel {
  String name;
  String country;
  String image;
  String population;
  String currency;
  PlacesModel({
    required this.name,
    required this.country,
    required this.image,
    required this.population,
    required this.currency,
  });

  PlacesModel copyWith({
    String? name,
    String? country,
    String? image,
    String? population,
    String? currency,
  }) {
    return PlacesModel(
      name: name ?? this.name,
      country: country ?? this.country,
      image: image ?? this.image,
      population: population ?? this.population,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'image': image,
      'population': population,
      'currency': currency,
    };
  }

  factory PlacesModel.fromMap(Map<String, dynamic> map) {
    return PlacesModel(
      name: map['name'] as String,
      country: map['country'] as String,
      image: map['image'] as String,
      population: map['population'] as String,
      currency: map['currency'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlacesModel.fromJson(String source) =>
      PlacesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlacesModel(name: $name, country: $country, image: $image, population: $population, currency: $currency)';
  }

}
