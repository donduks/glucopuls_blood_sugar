import 'package:flutter/material.dart';
import 'package:glucopuls_2/converter/core/tabs.dart';
import 'package:glucopuls_2/core/home_page.dart';
import 'package:glucopuls_2/information/presentation/info.dart';
import 'package:glucopuls_2/sugar_data/presentation/sugar_data_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const Tabs(),
    const DataPage(),
    const Information(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.accountConvertOutline),
            label: 'Converter',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.database),
            label: 'Data',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}
