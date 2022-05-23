import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/character_api.dart';
import 'package:flutter_application_1/core/blocs/character_bloc/character_bloc.dart';
import 'package:flutter_application_1/data/models/character/character_model.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view_store.dart';

class ControllerCharacterView {
  late ScrollController scrollController;
  bool _isLoadingMoreData = false;
  bool isEndOfList = false;
  List search = [];
  late CharacterRepo _characterRepo;
  final _store = StoreCharacterView();

  static final ControllerCharacterView _singleton = ControllerCharacterView._();

  factory ControllerCharacterView(BuildContext context) =>
      _singleton._instancia(context);

  ControllerCharacterView._();

  ControllerCharacterView _instancia(BuildContext context) {
    _singleton._characterRepo = CharacterRepo(context);

    return _singleton;
  }

  CharacterState get charactertRepoState => _characterRepo.state();

  void init() {
    scrollController = ScrollController()..addListener(listenerScroll);
    getCharacter();
  }

  void listenerScroll() async {
    final bool isEnd = scrollController.position.pixels >=
        (scrollController.position.maxScrollExtent - 100);
    if (isEndOfList == false) {
      getMoreCharacter(isEnd);
    }
  }

  void getMoreCharacter(bool isEnd) async {
    if (isEnd && !_isLoadingMoreData) {
      _store.currentValuePagination += valuePagination;
      _isLoadingMoreData = true;
      await getCharacter();

      _isLoadingMoreData = false;
    }
  }

  Future getCharacter() async {
    CharacterModel? dataModel = await CharacterApi.getCharacter();

    if (dataModel != null) {
      if (dataModel.info!.pages != _store.currentValuePagination) {
        _characterRepo.updateCharacterContent(
          [...charactertRepoState.characterContent, ...dataModel.results],
        );
      } else {
        isEndOfList = true;
      }
    }
  }

  Future getCharacterSearch() async {
    CharacterModel? dataModel = await CharacterApi.getCharacter();

    if (dataModel != null) {
      search.addAll(dataModel.results);
    }
  }

  void dispose() {
    _characterRepo.clearDataCharacters();
    _store.currentValuePagination = 1;
    scrollController.removeListener(listenerScroll);
    scrollController.dispose();
    isEndOfList = false;
  }
}
