import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/sugar_data/infrastructure/fasting_floating_action_button.dart';
import 'package:hive_flutter/adapters.dart';

import 'list_view_pages.dart/fasting_list_view.dart';

class FastingDataPage extends ConsumerStatefulWidget {
  const FastingDataPage({super.key});

  @override
  ConsumerState<FastingDataPage> createState() => _FastingDataPageState();
}

class _FastingDataPageState extends ConsumerState<FastingDataPage> {
  final TextEditingController textEditingController = TextEditingController();

  Box? bloodSugarDataBox;
  Box? bloodSugarDataBox2;

  @override
  void initState() {
    super.initState();
    Hive.openBox('bloodSugarData_box').then((box) {
      setState(() {
        bloodSugarDataBox = box;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: fastingActionButton(
        context,
        textEditingController,
        ref,
        bloodSugarDataBox,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    if (bloodSugarDataBox == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ValueListenableBuilder(
      valueListenable: bloodSugarDataBox!.listenable(),
      builder: (context, box, widget) {
        final bloodSugarKeys = box.keys.toList().reversed.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: fastingDataPage(
                bloodSugarKeys,
                bloodSugarDataBox,
              ),
            ),
          ],
        );
      },
    );
  }
}
