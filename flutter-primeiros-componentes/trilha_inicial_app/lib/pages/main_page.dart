import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/card_page.dart';
import 'package:trilha_inicial_app/pages/page2.dart';
import 'package:trilha_inicial_app/pages/page3.dart';
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
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Main Page",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
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
                  children: const [CardPage(), Page2Page(), Page3Page()]),
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
