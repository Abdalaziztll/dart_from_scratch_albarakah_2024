import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GeoModel {
  String lat;
  String lng;
  GeoModel({
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lat': lat,
      'lng': lng,
    };
  }

  factory GeoModel.fromMap(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'] as String,
      lng: map['lng'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeoModel.fromJson(String source) =>
      GeoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GeoModel(lat: $lat, lng: $lng)';
}



class AddressModel {
  String street;
  String suite;
  String city;
  String zipcode;
  GeoModel geo;
  AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toMap(),
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street: map['street'] as String,
      suite: map['suite'] as String,
      city: map['city'] as String,
      zipcode: map['zipcode'] as String,
      geo: GeoModel.fromMap(map['geo'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AddressModel(street: $street, suite: $suite, city: $city, zipcode: $zipcode, geo: $geo)';
  }
}

class UserModel {
  String name;
  int id;
  String username;
  String email;
  AddressModel address;
  String phone;
  String website;
  UserModel({
    required this.name,
    required this.id,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'username': username,
      'email': email,
      'address': address.toMap(),
      'phone': phone,
      'website': website,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      address: AddressModel.fromMap(map['address'] as Map<String,dynamic>),
      phone: map['phone'] as String,
      website: map['website'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, id: $id, username: $username, email: $email, address: $address, phone: $phone, website: $website)';
  }
}
