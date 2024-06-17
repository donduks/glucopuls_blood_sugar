import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../core/widgets/colors.dart';
import 'fasting_data_page.dart';
import 'random_data_page.dart';

bool fastingIsSelect = false;
bool randomIsSelect = false;

class DataPage extends ConsumerStatefulWidget {
  const DataPage({super.key});

  @override
  ConsumerState<DataPage> createState() => _DataPageState();
}

class _DataPageState extends ConsumerState<DataPage> {
  Box? bloodSugarDataBox;
  Box? bloodSugarDataBox2;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fastingIsSelect = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.15,
              decoration: BoxDecoration(
                color: kTextFieldFillColor,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(5, 0),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Hello Duks',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kButtonsTextColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: const AssetImage('images/beat.gif'),
                    backgroundColor: kButtonsColor,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'Sugar Data',
                    style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: kButtonsTextColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      fastingIsSelect = true;
                      randomIsSelect = false;
                    });
                  },
                  child: Text(
                    'Fasting',
                    style: TextStyle(
                      color: fastingIsSelect ? Colors.blue : Colors.black26,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      fastingIsSelect = false;
                      randomIsSelect = true;
                    });
                  },
                  child: Text(
                    'Random',
                    style: TextStyle(
                      color: randomIsSelect ? Colors.blue : Colors.black38,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: fastingIsSelect
                  ? const FastingDataPage()
                  : const RandomDataPage(),
            )
          ],
        ),
      ),
    );
  }
}
