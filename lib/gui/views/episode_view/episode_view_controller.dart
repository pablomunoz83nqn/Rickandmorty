import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/api/episode_api.dart';
import 'package:flutter_application_1/core/blocs/episode_bloc/episode_bloc.dart';
import 'package:flutter_application_1/data/models/episode/episode_model.dart';
import 'package:flutter_application_1/gui/views/episode_view/character_view_store.dart';

class ControllerEpisodeView {
  late ScrollController scrollController;
  bool _isLoadingMoreData = false;
  bool isEndOfList = false;

  late EpisodeRepo _episodeRepo;
  final _store = StoreEpisodeView();

  static final ControllerEpisodeView _singleton = ControllerEpisodeView._();

  factory ControllerEpisodeView(BuildContext context) =>
      _singleton._instancia(context);

  ControllerEpisodeView._();

  ControllerEpisodeView _instancia(BuildContext context) {
    _singleton._episodeRepo = EpisodeRepo(context);

    return _singleton;
  }

  EpisodeState get episodetRepoState => _episodeRepo.state();

  void init() {
    scrollController = ScrollController()..addListener(listenerScroll);
    getEpisode();
  }

  void listenerScroll() async {
    final bool isEnd = scrollController.position.pixels >=
        (scrollController.position.maxScrollExtent - 100);
    if (isEndOfList == false) {
      getMoreEpisode(isEnd);
    }
  }

  void getMoreEpisode(bool isEnd) async {
    if (isEnd && !_isLoadingMoreData) {
      _store.currentValuePagination += valuePagination;
      _isLoadingMoreData = true;
      await getEpisode();

      _isLoadingMoreData = false;
    }
  }

  Future getEpisode() async {
    EpisodeModel? dataModel = await EpisodeApi.getEpisode();

    if (dataModel != null) {
      if (dataModel.info!.pages != _store.currentValuePagination) {
        _episodeRepo.updateEpisodeContent(
          [...episodetRepoState.episodeContent, ...dataModel.results],
        );
      } else {
        isEndOfList = true;
      }
    }
  }

  void dispose() {
    _episodeRepo.clearDataEpisodes();
    _store.currentValuePagination = 1;
    scrollController.removeListener(listenerScroll);
    scrollController.dispose();
    isEndOfList = false;
  }
}
