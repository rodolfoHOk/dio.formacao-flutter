import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage>
    with TickerProviderStateMixin {
  // var pageController = PageController(initialPage: 0);
  // int pagePosition = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "Bottom Bar"),
        // body: PageView(
        body: TabBarView(
          controller: tabController,
          // onPageChanged: (value) {
          //   setState(() {
          //     pagePosition = value;
          //   });
          // },
          children: [
            Container(color: Colors.yellow),
            Container(color: Colors.red),
            Container(color: Colors.black),
            Container(color: Colors.green),
            Container(color: Colors.purple),
          ],
        ),
        // bottomNavigationBar: ConvexAppBar(
        bottomNavigationBar: ConvexAppBar.badge(
          const {0: '99+', 1: Icons.assistant_photo, 2: Colors.redAccent},
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => tabController.index = i,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   onTap: (index) => pageController.jumpToPage(index),
        //   currentIndex: pagePosition,
        //   items: const [
        //     BottomNavigationBarItem(
        //       backgroundColor: Colors.blue,
        //       label: "Page A",
        //       icon: FaIcon(
        //         FontAwesomeIcons.a,
        //         color: Colors.yellow,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       backgroundColor: Colors.blue,
        //       label: "Page B",
        //       icon: FaIcon(
        //         FontAwesomeIcons.b,
        //         color: Colors.red,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       backgroundColor: Colors.blue,
        //       label: "Page C",
        //       icon: FaIcon(
        //         FontAwesomeIcons.c,
        //         color: Colors.black,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       backgroundColor: Colors.blue,
        //       label: "Page D",
        //       icon: FaIcon(
        //         FontAwesomeIcons.d,
        //         color: Colors.greenAccent,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       backgroundColor: Colors.blue,
        //       label: "Page E",
        //       icon: FaIcon(
        //         FontAwesomeIcons.e,
        //         color: Colors.purple,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
