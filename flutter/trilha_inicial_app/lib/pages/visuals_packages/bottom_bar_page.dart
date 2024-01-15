import 'package:flutter/material.dart';
import 'package:trilha_inicial_app/pages/state_managers/counter_mobx_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/counter_mobx_store_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/counter_provider_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/task_mobx_page.dart';
import 'package:trilha_inicial_app/pages/state_managers/task_provider_page.dart';
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
            const CounterProviderPage(),
            TaskProviderPage(),
            CounterMobXPage(),
            CounterMobXStorePage(),
            TaskMobXPage(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          controller: tabController,
          items: const [
            TabItem(icon: Icons.home, title: 'PContador'),
            TabItem(icon: Icons.map, title: 'PTarefas'),
            TabItem(icon: Icons.add, title: 'MContador'),
            TabItem(icon: Icons.message, title: 'MSContador'),
            TabItem(icon: Icons.people, title: 'MSTarefas'),
          ],
          onTap: (int i) => tabController.index = i,
        ),
      ),
    );
  }
}
