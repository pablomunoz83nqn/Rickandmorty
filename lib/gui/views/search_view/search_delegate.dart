import 'package:flutter/material.dart';
import 'package:flutter_application_1/gui/views/character_view/character_view_controller.dart';

class CharacterSearchDelegate extends SearchDelegate {
  CharacterSearchDelegate({
    required this.controller,
  });

  final ControllerCharacterView controller;

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar personaje';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List quotes = controller.search;
    List _filter = quotes.where((name) {
      return name.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.separated(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(border: Border.all()),
          child: ListTile(
            leading: Image.network(_filter[index].image),
            title: Text(_filter[index].name),
            subtitle: Text(_filter[index].status),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10.0,
        );
      },
    );
  }
}
