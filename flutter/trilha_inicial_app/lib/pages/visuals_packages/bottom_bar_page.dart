import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/state_managers/counter_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/task_page.dart';
import 'package:trilha_inicial_app/pages/visuals_packages/brasil_fields_page.dart';
import 'package:trilha_inicial_app/shared/widgets/custom_app_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage>
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
            const CounterPage(),
            TaskPage(),
            Container(color: Colors.black),
            Container(color: Colors.green),
            const BrasilFieldsPage(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'Contador'),
            TabItem(icon: Icons.map, title: 'Tarefas'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Brasil'),
          ],
          onTap: (int i) => tabController.index = i,
        ),
      ),
    );
  }
}
