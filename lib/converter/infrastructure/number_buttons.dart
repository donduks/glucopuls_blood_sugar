import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/core/widgets/share/providers.dart';
import 'package:glucopuls_2/core/widgets/colors.dart';

class NumberButtons extends StatelessWidget {
  const NumberButtons({
    super.key,
    required this.number,
    required this.ref,
  });

  final String number;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonsColor,
      ),
      onPressed: () =>
          ref.read(numberProvider.notifier).onNumberPressed(number),
      //onNumberPressed(number),
      child: Text(number),
    );
  }
}
