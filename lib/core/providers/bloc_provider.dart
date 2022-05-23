import 'package:flutter_application_1/core/blocs/character_bloc/character_bloc.dart';
import 'package:flutter_application_1/core/blocs/episode_bloc/episode_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> storeBlocProvider = [
  BlocProvider<CharacterBloc>(create: (_) => CharacterBloc()),
  BlocProvider<EpisodeBloc>(create: (_) => EpisodeBloc()),
];
