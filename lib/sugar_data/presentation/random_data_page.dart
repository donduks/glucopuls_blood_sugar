import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/sugar_data/infrastructure/random_floating_action_button.dart';
import 'package:hive_flutter/adapters.dart';

import 'list_view_pages.dart/random_list_view.dart';

class RandomDataPage extends ConsumerStatefulWidget {
  const RandomDataPage({super.key});

  @override
  ConsumerState<RandomDataPage> createState() => _RandomDataPageState();
}

class _RandomDataPageState extends ConsumerState<RandomDataPage> {
  final TextEditingController textEditingController = TextEditingController();

  Box? bloodSugarDataBox2;

  @override
  void initState() {
    super.initState();
    Hive.openBox('bloodSugarData2_box2').then((box2) {
      setState(() {
        bloodSugarDataBox2 = box2;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: randomActionButton(
        context,
        textEditingController,
        ref,
        bloodSugarDataBox2,
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    if (bloodSugarDataBox2 == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return ValueListenableBuilder(
      valueListenable: bloodSugarDataBox2!.listenable(),
      builder: (context, box2, widget) {
        final bloodSugarKeys2 = box2.keys.toList().reversed.toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: randomDataPage(
                bloodSugarKeys2,
                bloodSugarDataBox2,
              ),
            ),
          ],
        );
      },
    );
  }
}
