part of 'episode_bloc.dart';

@immutable
abstract class EpisodeEvent {}

class EpisodesEventHistory extends EpisodeEvent {
  final EpisodeModel? transtactionHistory;

  EpisodesEventHistory(
    this.transtactionHistory,
  );
}

class EpisodesEventContent extends EpisodeEvent {
  final List<EpisodeContentModel>? episodeContentHistory;

  EpisodesEventContent(
    this.episodeContentHistory,
  );
}

class EpisodesClearEventContent extends EpisodeEvent {}
