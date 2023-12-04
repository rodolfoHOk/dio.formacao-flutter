import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/page1.dart';
import 'package:trilha_inicial_app/pages/page2.dart';
import 'package:trilha_inicial_app/pages/page3.dart';
import 'package:trilha_inicial_app/pages/registration_data.dart';

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
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Dados cadastrais")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const RegistrationDataPage()));
                  },
                ),
                const Divider(),
                SizedBox(height: 10, child: Container()),
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                ),
                const Divider(),
                SizedBox(height: 10, child: Container()),
                InkWell(
                  child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
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
                  children: const [Page1Page(), Page2Page(), Page3Page()]),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: pagePosition,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Page 1"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book), label: "Page 2"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add), label: "Page 3"),
                ])
          ],
        ),
      ),
    );
  }
}
