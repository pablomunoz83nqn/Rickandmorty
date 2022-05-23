part of 'episode_bloc.dart';

class EpisodeRepo {
  late BuildContext _context;
  late EpisodeBloc _bloc;

  static final EpisodeRepo _singleton = EpisodeRepo._();

  factory EpisodeRepo(BuildContext context) => _singleton._instancia(context);

  EpisodeRepo._();

  EpisodeRepo _instancia(BuildContext context) {
    _singleton._context = context;
    _singleton._bloc = BlocProvider.of<EpisodeBloc>(_context);
    return _singleton;
  }

  EpisodeBloc bloc() => _bloc;
  EpisodeState state() => bloc().state;

  void updateEpisodeHistory(EpisodeModel? episode) =>
      bloc().add(EpisodesEventHistory(episode));
  void updateEpisodeContent(List<EpisodeContentModel>? episodeContent) =>
      bloc().add(EpisodesEventContent(episodeContent));
  void clearDataEpisodes() => bloc().add(EpisodesClearEventContent());
}
