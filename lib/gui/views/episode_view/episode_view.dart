import 'package:flutter/material.dart';
import 'package:flutter_application_1/gui/views/episode_view/episode_view_widgets/episode_view_form.dart';

class EpisodeView extends StatelessWidget {
  const EpisodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(122, 0, 0, 0),
          title: const Text(
            'Episodios',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return const EpisodeMainView();
  }
}
