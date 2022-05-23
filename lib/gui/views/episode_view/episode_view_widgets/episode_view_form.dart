import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/blocs/episode_bloc/episode_bloc.dart';

import 'package:flutter_application_1/data/models/episode/episode_model.dart';
import 'package:flutter_application_1/gui/views/episode_view/episode_view_controller.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_loader/image_helper.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EpisodeMainView extends StatefulWidget {
  const EpisodeMainView({Key? key}) : super(key: key);

  @override
  _FormEpisodeViewState createState() => _FormEpisodeViewState();
}

class _FormEpisodeViewState extends State<EpisodeMainView> {
  late ControllerEpisodeView controller;

  String? selectedValue;

  @override
  void initState() {
    super.initState();

    controller = ControllerEpisodeView(context)..init();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return BlocBuilder<EpisodeBloc, EpisodeState>(
      builder: (context, state) {
        return Column(
          children: [
            _header(),
            _list(state.episodeContent),
            _footer(),
          ],
        );
      },
    );
  }

  Widget _header() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: ImageHelper(
                alignment: Alignment.topRight,
                imageType: ImageType.asset,
                imageShape: ImageShape.rectangle,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                boxFit: BoxFit.fitWidth,
                image: 'assets/images/back.png',
                defaultLoaderColor: Colors.red,
                blendMode: BlendMode.hue,
                defaultErrorBuilderColor: Colors.blueGrey,
                loaderBuilder: const CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset(
                'assets/images/logoName.png',
              ),
            ),
          ],
        ));
  }

  Widget _footer() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              child: ImageHelper(
                alignment: Alignment.bottomCenter,
                imageType: ImageType.asset,
                imageShape: ImageShape.rectangle,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                boxFit: BoxFit.fitWidth,
                image: 'assets/images/back.png',
                defaultLoaderColor: Colors.red,
                blendMode: BlendMode.hue,
                defaultErrorBuilderColor: Colors.blueGrey,
                loaderBuilder: const CircularProgressIndicator(),
              ),
            ),
            SizedBox(width: 300, child: Image.asset('assets/images/logo.png'))
          ],
        ));
  }

  Widget _list(List<EpisodeContentModel> historyEpisode) {
    return Expanded(
      child: historyEpisode.isEmpty
          ? Image.asset('assets/images/loading.gif')
          : ListView.separated(
              controller: controller.scrollController,
              itemCount: historyEpisode.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (BuildContext context, index) {
                final EpisodeContentModel episodeContent =
                    historyEpisode[index];
                return _description(episodeContent);
              },
            ),
    );
  }

  Widget _description(EpisodeContentModel content) {
    String episodeString = content.episode;
    List splitSeason = episodeString.split('');
    String season = splitSeason[2];
    String episode = splitSeason[5];
    final url =
        'https://entrepeliculasyseries.nz/episodio/rick-and-morty-temporada-$season'
                '-'
                'capitulo'
                '-' +
            episode;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _launchUrl(url),
          child: Card(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Ver episodio!'),
                        Icon(
                          Icons.play_arrow,
                          size: 80.0,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(content.episode),
                          ],
                        ),
                        Text(
                          content.name,
                          style: const TextStyle(fontSize: 30.0),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          'Featured at:',
                          style: TextStyle(color: Colors.black45),
                        ),
                        Text(content.air_date),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Created at:',
                          style: TextStyle(color: Colors.black45),
                        ),
                        Text(content.created),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl(url) {
    launchUrlString(url);
  }
}
