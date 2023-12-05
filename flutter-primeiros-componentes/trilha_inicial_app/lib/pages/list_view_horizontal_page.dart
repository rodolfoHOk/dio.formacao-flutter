import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/shared/app_images.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';

class ListViewHorizontalPage extends StatefulWidget {
  const ListViewHorizontalPage({super.key});

  @override
  State<ListViewHorizontalPage> createState() => _ListViewHorizontalPageState();
}

class _ListViewHorizontalPageState extends State<ListViewHorizontalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Meu App"),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem1,
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem2,
                ),
              ),
              Card(
                elevation: 8,
                child: Image.asset(
                  AppImages.paisagem3,
                ),
              )
            ],
          ),
        ),
        Expanded(flex: 2, child: Container())
      ]),
    );
  }
}
