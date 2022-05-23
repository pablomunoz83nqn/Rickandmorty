part of 'character_bloc.dart';

class CharacterState {
  final CharacterModel character;
  final List<CharacterContentModel> characterContent;

  const CharacterState.empty()
      : character = const CharacterModel(),
        characterContent = const [];

  CharacterState({
    this.character = const CharacterModel(),
    this.characterContent = const [],
  });

  CharacterState copyWith({
    CharacterModel? character,
    List<CharacterContentModel>? characterContent,
  }) =>
      CharacterState(
        character: character ?? this.character,
        characterContent: characterContent ?? this.characterContent,
      );
}
