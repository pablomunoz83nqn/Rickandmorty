import 'package:flutter_application_1/core/blocs/character_bloc/character_bloc.dart';

import 'package:flutter_application_1/data/models/character/character_model.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/gui/views/search_view/search_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_loader/image_helper.dart';

class CharacterMainView extends StatefulWidget {
  const CharacterMainView({Key? key}) : super(key: key);

  @override
  _FormCharacterViewState createState() => _FormCharacterViewState();
}

class _FormCharacterViewState extends State<CharacterMainView> {
  late ControllerCharacterView controller;

  String? selectedValue;

  @override
  void initState() {
    super.initState();

    controller = ControllerCharacterView(context)..init();
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
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Column(
          children: [
            _header(),
            _search(),
            _list(state.characterContent),
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
        height: MediaQuery.of(context).size.height * 0.075,
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
                blendMode: BlendMode.hue,
                defaultErrorBuilderColor: Colors.blueGrey,
                loaderBuilder: const CircularProgressIndicator(),
              ),
            ),
            SizedBox(width: 200, child: Image.asset('assets/images/logo.png'))
          ],
        ));
  }

  Widget _search() {
    return Container(
      decoration: const BoxDecoration(color: Colors.amber),
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Buscar personaje',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            width: 30.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )),
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(18, 85, 95, 1)), //Background Color
            ),
            onPressed: () {
              controller.getCharacterSearch();
              showSearch(
                  context: context,
                  delegate: CharacterSearchDelegate(controller: controller));
            },
            child: const Icon(
              Icons.search,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _list(List<CharacterContentModel> historyCharacter) {
    return Expanded(
      child: historyCharacter.isEmpty
          ? ImageHelper(
              imageType: ImageType.asset,
              imageShape: ImageShape.rectangle,
              boxFit: BoxFit.fitHeight,
              image: 'assets/images/loading.gif',
              defaultLoaderColor: Colors.black,
              blendMode: BlendMode.hue,
              defaultErrorBuilderColor: Colors.blueGrey,
              loaderBuilder: const CircularProgressIndicator(),
            )
          : Stack(
              alignment: Alignment.bottomRight,
              children: [
                ListView.separated(
                  controller: controller.scrollController,
                  itemCount: historyCharacter.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (BuildContext context, index) {
                    final CharacterContentModel characterContent =
                        historyCharacter[index];
                    return _description(characterContent);
                  },
                ),
                GestureDetector(
                  onTap: (() => Navigator.pushNamed(context, 'episode')),
                  child: SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/episodios.gif')),
                ),
              ],
            ),
    );
  }

  Widget _description(CharacterContentModel content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        child: Card(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: ImageHelper(
                  imageType: ImageType.network,
                  imageShape: ImageShape.rectangle,
                  boxFit: BoxFit.fitHeight,
                  image: content.image,
                  defaultLoaderColor: Colors.black,
                  blendMode: BlendMode.hue,
                  defaultErrorBuilderColor: Colors.blueGrey,
                  loaderBuilder: const CircularProgressIndicator(),
                ),
                flex: 4,
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
                          content.status == 'Alive'
                              ? const Icon(Icons.trip_origin_rounded,
                                  size: 12.0, color: Colors.green)
                              : const Icon(
                                  Icons.trip_origin_rounded,
                                  color: Colors.red,
                                  size: 12.0,
                                ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(content.status),
                          Text(' - ' + content.species),
                        ],
                      ),
                      Text(
                        content.name,
                        style: const TextStyle(fontSize: 20.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'Last know location:',
                        style: TextStyle(color: Colors.black45),
                      ),
                      Text(content.origin!.name),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Origin location:',
                        style: TextStyle(color: Colors.black45),
                      ),
                      Text(content.location!.name),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
