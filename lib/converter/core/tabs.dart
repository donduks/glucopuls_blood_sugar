import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/converter/presentation/mgdl_converter.dart';
import 'package:glucopuls_2/converter/presentation/mmol_converter.dart';
import 'package:glucopuls_2/core/providers.dart';
import 'package:glucopuls_2/core/widgets/colors.dart';

class Tabs extends ConsumerWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTextFieldFillColor,
          title: Text(
            'Hello $name',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: kButtonsTextColor,
            ),
          ),
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
