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
  final ScrollController _scrollController = ScrollController();

  late MarvelRepository marvelRepository;
  CharactersModel? characters;
  int offset = 0;
  var loading = false;

  void loadData() async {
    if (loading) {
      return;
    }
    if (characters == null || characters!.data == null) {
      characters = await marvelRepository.getCharacters(offset);
    } else {
      setState(() {
        loading = true;
      });
      offset = offset + characters!.data!.count!;
      if (offset < getTotalQuantity()) {
        var tempList = await marvelRepository.getCharacters(offset);
        characters!.data!.results!.addAll(tempList.data!.results!);
      }
    }
    setState(() {
      loading = false;
    });
  }

  int getCurrentQuantity() {
    try {
      return characters!.data!.results!.length;
    } catch (e) {
      return 0;
    }
  }

  int getTotalQuantity() {
    try {
      return characters!.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    marvelRepository = MarvelRepository();
    loadData();
    _scrollController.addListener(() {
      var paginationPosition = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > paginationPosition) {
        loadData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            title: "Heróis: ${getCurrentQuantity()}/${getTotalQuantity()}"),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: characters == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                    !loading
                        ? ElevatedButton(
                            onPressed: () {
                              loadData();
                            },
                            child: const Text(
                              'Carregar mais items',
                            ),
                          )
                        : const CircularProgressIndicator()
                  ],
                ),
        ),
      ),
    );
  }
}
