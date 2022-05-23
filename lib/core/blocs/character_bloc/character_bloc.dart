import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/models/character/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_event.dart';

part 'character_state.dart';

part 'character_repo.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterState()) {
    on<CharacterEvent>((event, emit) {
      if (event is CharactersEventHistory) {
        emit(state.copyWith(character: event.transtactionHistory));
      } else if (event is CharactersEventContent) {
        emit(
          state.copyWith(characterContent: event.characterContentHistory),
        );
      } else if (event is CharactersClearEventContent) {
        emit(const CharacterState.empty());
      }
    });
  }
}
