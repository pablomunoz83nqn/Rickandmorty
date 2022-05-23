import 'package:flutter/material.dart';
import 'package:image_loader/image_helper.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: ImageHelper(
            opacity: AlwaysStoppedAnimation<double>(0.2),
            imageType: ImageType.asset,
            imageShape: ImageShape.rectangle,
            height: MediaQuery.of(context).size.height,
            boxFit: BoxFit.fitHeight,
            image: 'assets/images/back.png',
            defaultLoaderColor: Colors.red,
            blendMode: BlendMode.hue,
            defaultErrorBuilderColor: Colors.blueGrey,
            loaderBuilder: const CircularProgressIndicator(),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.15,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Image.asset(
              'assets/images/logoName.png',
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const DefaultTextStyle(
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                child: Text(
                  'Bienvenido \na Rick and Morty',
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: const DefaultTextStyle(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                child: Text(
                  'En esta prueba, evaluaremos su capacidad para construit la aplicación mediante el análisis de código \ny la reproducción del siquiente diseño.',
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: SizedBox(
                height: 46.0,
                width: 126.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(18, 85, 95, 1)), //Background Color
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'character');
                  },
                  child: const Text(
                    'Continuar',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
