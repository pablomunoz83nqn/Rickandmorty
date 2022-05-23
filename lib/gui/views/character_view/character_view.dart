import 'package:flutter/material.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view_widgets/character_view_form.dart';

class CharacterView extends StatelessWidget {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return const CharacterMainView();
  }
}
