import 'package:flutter/material.dart';
import 'package:pet_adoption/model/pet_model.dart';
import 'package:pet_adoption/services/pet_services.dart';

class petProvider with ChangeNotifier {
  final _service = petService();
  bool isLoading = false;
  List<petsDetails> _pets = [];
  List<petsDetails> get pets => _pets;

  Future<void> getAllpets() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _pets = response;
    isLoading = false;
    notifyListeners();
  }
}
