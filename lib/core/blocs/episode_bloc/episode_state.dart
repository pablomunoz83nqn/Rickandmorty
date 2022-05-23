part of 'episode_bloc.dart';

class EpisodeState {
  final EpisodeModel episode;
  final List<EpisodeContentModel> episodeContent;

  const EpisodeState.empty()
      : episode = const EpisodeModel(),
        episodeContent = const [];

  EpisodeState({
    this.episode = const EpisodeModel(),
    this.episodeContent = const [],
  });

  EpisodeState copyWith({
    EpisodeModel? episode,
    List<EpisodeContentModel>? episodeContent,
  }) =>
      EpisodeState(
        episode: episode ?? this.episode,
        episodeContent: episodeContent ?? this.episodeContent,
      );
}
