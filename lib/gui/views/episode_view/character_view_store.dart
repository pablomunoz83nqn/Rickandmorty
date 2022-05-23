import 'package:flutter_application_1/data/models/episode/episode_model.dart';

const int valuePagination = 1;

class StoreEpisodeView {
  static final StoreEpisodeView _singleton = StoreEpisodeView._();
  factory StoreEpisodeView() => _singleton;
  StoreEpisodeView._();

  int currentValuePagination = 1;
  int get range => currentValuePagination;

  EpisodeModel episodesData = const EpisodeModel();
}
