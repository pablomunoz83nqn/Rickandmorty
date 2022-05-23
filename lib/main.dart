import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/config/init_app_config.dart';
import 'package:flutter_application_1/core/providers/bloc_provider.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view.dart';
import 'package:flutter_application_1/gui/views/episode_view/episode_view.dart';
import 'package:flutter_application_1/gui/views/main_view/main_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initAppConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: storeBlocProvider,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          // Cuando naveguemos hacia la ruta "/", crearemos el Widget FirstScreen
          '/': (context) => const HomeView(),
          'character': (context) => const CharacterView(),

          // Cuando naveguemos hacia la ruta "/second", crearemos el Widget SecondScreen
          'episode': (context) => const EpisodeView(),
        },
      ),
    );
  }
}
