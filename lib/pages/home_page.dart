import 'package:flutter/material.dart';
import 'package:timer_scan_app/pages/timer_task/timer_task_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  final List<BottomNavigationItem> _bottomNavigationItems =
      <BottomNavigationItem>[
    const BottomNavigationItem(
        Icon(Icons.home), 'Running timers', TimerTaskListPage()),
    const BottomNavigationItem(
        Icon(Icons.history), 'History timers', TimerTaskListPage()),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: const Color(0xFF101725),
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            onTap: (final int index) => setState(() => _selectedIndex = index),
            items: _bottomNavigationItems
                .map((final BottomNavigationItem item) =>
                    BottomNavigationBarItem(icon: item.icon, label: item.label))
                .toList()),
        body: _bottomNavigationItems[_selectedIndex].page,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
}

@immutable
class BottomNavigationItem {
  final Icon icon;
  final String label;
  final Widget page;

  const BottomNavigationItem(this.icon, this.label, this.page);
}
