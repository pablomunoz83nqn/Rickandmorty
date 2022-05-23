part of 'character_bloc.dart';

class CharacterRepo {
  late BuildContext _context;
  late CharacterBloc _bloc;

  static final CharacterRepo _singleton = CharacterRepo._();

  factory CharacterRepo(BuildContext context) => _singleton._instancia(context);

  CharacterRepo._();

  CharacterRepo _instancia(BuildContext context) {
    _singleton._context = context;
    _singleton._bloc = BlocProvider.of<CharacterBloc>(_context);
    return _singleton;
  }

  CharacterBloc bloc() => _bloc;
  CharacterState state() => bloc().state;

  void updateCharacterHistory(CharacterModel? character) =>
      bloc().add(CharactersEventHistory(character));
  void updateCharacterContent(List<CharacterContentModel>? characterContent) =>
      bloc().add(CharactersEventContent(characterContent));
  void clearDataCharacters() => bloc().add(CharactersClearEventContent());
}
