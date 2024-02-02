import 'package:flutter/material.dart';
import 'package:pet_adoption/model/pet_model.dart';
import 'package:pet_adoption/services/pet_services.dart';

class petProvider with ChangeNotifier {
  final _service = petService();
  bool isLoading = false;
  List<petsDetails> _pets = [];
  List<petsDetails> get pets => _pets;
  List<petsDetails> _Adoptedpets = [];
  List<petsDetails> get Adoptedpets => _Adoptedpets;
  List<petsDetails> _dog = [];
  List<petsDetails> get dog => _dog;

  Future<void> getAllpets(String searchvalue) async {
    // print(searchvalue);
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    if (searchvalue.isNotEmpty) {
      _pets = response.where((element) {
        print(element.name.toString().contains(searchvalue));
        return element.name
            .toLowerCase()
            .contains(searchvalue.trim().toString());
      }).toList();
    } else {
      _pets = response;
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAlladopted() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _Adoptedpets = response.where((pet) => pet.adopt == true).toList();
    _Adoptedpets.sort((a, b) => b.adoptat.compareTo(a.adoptat));

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllDogs() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response.where((pet) => pet.type == "dog").toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllcat() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response.where((pet) => pet.type == "cat").toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllrabbit() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response.where((pet) => pet.type == "rabbit").toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllturtle() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response.where((pet) => pet.type == "turtle").toList();
    ;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAllparrot() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response.where((pet) => pet.type == "parrot").toList();

    isLoading = false;
    notifyListeners();
  }
}
