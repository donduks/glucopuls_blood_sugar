import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/core/providers.dart';

class Information extends ConsumerStatefulWidget {
  const Information({super.key});

  @override
  ConsumerState<Information> createState() => _InformationState();
}

class _InformationState extends ConsumerState<Information> {
  //String myName = '';
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $name'),
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Your User Name'),
                        content: TextField(
                          controller: nameController,
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                ref
                                    .read(nameProvider.notifier)
                                    .addName(nameController.text);

                                Navigator.pop(context);
                                nameController.clear();
                              },
                              child: const Text('Save'))
                        ],
                      );
                    });
              },
              child: const Text('click to enter name'))
        ],
      ),
      body: const SafeArea(
        child: Column(),
      ),
    );
  }
}
