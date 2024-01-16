import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/state_managers/counter_getx_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/task_getx_page.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarPageTwo extends StatefulWidget {
  const BottomBarPageTwo({super.key});

  @override
  State<BottomBarPageTwo> createState() => _BottomBarPageTwoState();
}

class _BottomBarPageTwoState extends State<BottomBarPageTwo>
    with TickerProviderStateMixin {
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
        body: TabBarView(
          controller: tabController,
          children: [
            CounterGetXPage(),
            TaskGetXPage(),
            Container(color: Colors.blue),
            Container(color: Colors.yellow),
            Container(color: Colors.red),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'GContador'),
            TabItem(icon: Icons.map, title: 'Tab 2'),
            TabItem(icon: Icons.add, title: 'Tab 3'),
            TabItem(icon: Icons.message, title: 'Tab 4'),
            TabItem(icon: Icons.people, title: 'Tab 5'),
          ],
          onTap: (int i) => tabController.index = i,
        ),
      ),
    );
  }
}
