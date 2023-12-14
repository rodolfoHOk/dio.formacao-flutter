import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/card_page.dart';
import 'package:trilha_inicial_app/pages/image_assets_page.dart';
import 'package:trilha_inicial_app/pages/list_view_horizontal_page.dart';
import 'package:trilha_inicial_app/pages/list_view_page.dart';
import 'package:trilha_inicial_app/pages/tasks/task_sqlite_page.dart';
import 'package:trilha_inicial_app/pages/cep_query.dart';
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
                    CEPQueryPage(),
                    CardPage(),
                    ImageAssetsPage(),
                    ListViewPage(),
                    ListViewHorizontalPage(),
                    TaskSQLitePage()
                  ]),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: pagePosition,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.get_app), label: "CEP"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.fit_screen), label: "Card"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.photo_library), label: "Assets"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt), label: "List V"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: "List H"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.task), label: "Tarefas")
                ])
          ],
        ),
      ),
    );
  }
}
