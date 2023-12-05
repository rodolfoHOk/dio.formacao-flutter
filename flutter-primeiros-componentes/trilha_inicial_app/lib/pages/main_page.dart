import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/card_page.dart';
import 'package:trilha_inicial_app/pages/image_assets_page.dart';
import 'package:trilha_inicial_app/pages/list_view_h_page.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Meu App"),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      pagePosition = value;
                    });
                  },
                  // scrollDirection: Axis.vertical,
                  children: const [
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewHPage()
                  ]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: pagePosition,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Card Page"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book), label: "Page 2"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.build), label: "Page 3"),
                ])
          ],
        ),
      ),
    );
  }
}
