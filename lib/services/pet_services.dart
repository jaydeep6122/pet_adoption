import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_adoption/model/pet_model.dart';
import 'package:pet_adoption/petdetails.dart';

class petService {
  Future<List<petsDetails>> getAll() async {
    // Change  Url as per Your LocalHost IP address
    final url = Uri.parse("http://192.168.1.2:3000/pets");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      // Assuming that your JSON structure is a list under the 'pets' key
      final List<dynamic> pets = json;

      // Map the petss to petsDetails
      final List<petsDetails> petsList = pets.map((pets) {
        //print("hello :- ${pets["author"]}");

        return petsDetails(
          name: pets["name"] ?? "Unknown Author",
          age: pets["age"] ?? "Default Image URL",
          price: pets["price"],
          adopt: pets['adopt'],
          photourl: pets["photoUrl"],
          location: pets["location"],
          type: pets["type"],
          adoptat: DateTime.parse(pets["adoptTime"]),
        );
      }).toList();
      return petsList;
    } else {
      throw Exception('Failed to load pets');
    }
  }
}
