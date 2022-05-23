import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/episode/episode_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'episode_event.dart';

part 'episode_state.dart';

part 'episode_repo.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc() : super(EpisodeState()) {
    on<EpisodeEvent>((event, emit) {
      if (event is EpisodesEventHistory) {
        emit(state.copyWith(episode: event.transtactionHistory));
      } else if (event is EpisodesEventContent) {
        emit(
          state.copyWith(episodeContent: event.episodeContentHistory),
        );
      } else if (event is EpisodesClearEventContent) {
        emit(const EpisodeState.empty());
      }
    });
  }
}
