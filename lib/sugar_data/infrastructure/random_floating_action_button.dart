import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

FloatingActionButton randomActionButton(
  BuildContext context,
  TextEditingController textEditingController,
  WidgetRef ref,
  Box? bloodSugarDataBox2,
) {
  return FloatingActionButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Data'),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: textEditingController,
              decoration: const InputDecoration(
                hintText: 'Sugar Reading...',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  bloodSugarDataBox2?.add(
                    {
                      'content': textEditingController.text,
                      'date': DateFormat('d.MM.yyy').format(DateTime.now()),
                      'time': DateFormat.jms().format(DateTime.now()),
                    },
                  );

                  Navigator.pop(context);
                  textEditingController.clear();
                },
                child: const Text('Save'),
              ),
            ],
          );
        },
      );
    },
    child: const Text('Save'),
  );
}
