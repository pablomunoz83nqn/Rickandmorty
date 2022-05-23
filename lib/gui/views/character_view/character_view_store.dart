import 'package:flutter_application_1/data/models/character/character_model.dart';

const int valuePagination = 1;

class StoreCharacterView {
  static final StoreCharacterView _singleton = StoreCharacterView._();
  factory StoreCharacterView() => _singleton;
  StoreCharacterView._();

  int currentValuePagination = 1;
  int get range => currentValuePagination;

  CharacterModel charactersData = const CharacterModel();
}
