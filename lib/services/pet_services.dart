import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_adoption/model/pet_model.dart';
import 'package:pet_adoption/petdetails.dart';

class petService {
  Future<List<petsDetails>> getAll() async {
    final url = Uri.parse("http://192.168.1.2:3000/pets");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      // Assuming that your JSON structure is a list under the 'petss' key
      final List<dynamic> petss = json;

      // Map the petss to petsDetails
      final List<petsDetails> petsList = petss.map((pets) {
        //print("hello :- ${pets["author"]}");

        return petsDetails(
          name: pets["name"] ?? "Unknown Author",
          age: pets["age"] ?? "Default Image URL",
          price: 100,
          adopt: pets['adopt'],
          photourl: pets["photoUrl"],
          location: pets["location"],
          type: pets["type"],
        );
      }).toList();
      return petsList;
    } else {
      throw Exception('Failed to load pets');
    }
  }
}
