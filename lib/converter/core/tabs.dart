import 'package:flutter/material.dart';
import 'package:glucopuls_2/converter/presentation/mgdl_converter.dart';
import 'package:glucopuls_2/converter/presentation/mmol_converter.dart';
import 'package:glucopuls_2/core/widgets/colors.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTextFieldFillColor,
          title: const Text('Hello Don'),
          bottom: const TabBar(tabs: [
            Tab(text: 'mmol'),
            Tab(text: 'mg/dl'),
          ]),
        ),
        body: const TabBarView(children: [
          MmolConverter(),
          MgdlConverter(),
        ]),
      ),
    );
  }
}
