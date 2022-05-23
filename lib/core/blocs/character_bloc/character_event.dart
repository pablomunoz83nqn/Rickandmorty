part of 'character_bloc.dart';

@immutable
abstract class CharacterEvent {}

class CharactersEventHistory extends CharacterEvent {
  final CharacterModel? transtactionHistory;

  CharactersEventHistory(
    this.transtactionHistory,
  );
}

class CharactersEventContent extends CharacterEvent {
  final List<CharacterContentModel>? characterContentHistory;

  CharactersEventContent(
    this.characterContentHistory,
  );
}

class CharactersClearEventContent extends CharacterEvent {}
