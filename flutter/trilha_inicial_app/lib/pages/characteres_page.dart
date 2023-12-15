import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/models/characters_model.dart';
import 'package:trilha_inicial_app/repositories/marvel/marvel_repository.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late MarvelRepository marvelRepository;
  CharactersModel? characters;

  void loadData() async {
    characters = await marvelRepository.getCharacters();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    marvelRepository = MarvelRepository();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Heróis"),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: characters == null
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: (characters!.data == null ||
                          characters!.data!.results == null)
                      ? 0
                      : characters!.data!.results!.length,
                  itemBuilder: (_, index) {
                    var character = characters!.data!.results![index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: Image.network(
                                    "${character.thumbnail!.path!}.${character.thumbnail!.extension!}"),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      character.name ?? "",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(character.description ?? ""),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
