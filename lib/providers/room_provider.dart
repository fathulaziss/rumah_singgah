import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Room {
  int? id;
  String? name;
  String? city;
  String? country;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchen;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Room({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchen,
    this.numberOfBedrooms,
    this.numberOfCupboards,
  });

  Room.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    photos = json['photos'];
    mapUrl = json['map_url'];
    numberOfKitchen = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }
}

class RoomProvider extends ChangeNotifier {
  getRecommendedRoom() async {
    var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Room> recommendedRoom = data.map((e) => Room.fromJson(e)).toList();
      print('cek StatusCode : ${result.statusCode}');
      print('cek Response : $data');
      return recommendedRoom;
    } else {
      return <Room>[];
    }
  }
}
