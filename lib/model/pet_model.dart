import 'package:flutter/material.dart';

class petsDetails {
  final String name;
  final String age;
  final int price;
  final bool adopt;
  final String photourl;
  final String location;
  final String type;

  petsDetails({
    required this.name,
    required this.age,
    required this.price,
    required this.adopt,
    required this.photourl,
    required this.location,
    required this.type,
  });
}
