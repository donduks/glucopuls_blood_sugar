import 'package:flutter/material.dart';
import 'package:glucopuls_2/core/widgets/colors.dart';

class Circles extends StatelessWidget {
  final Color bgColor;
  final double radiusBig;
  final double radiusSmall;
  const Circles({
    super.key,
    required this.bgColor,
    required this.radiusBig,
    required this.radiusSmall,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radiusBig,
          backgroundColor: bgColor,
        ),
        CircleAvatar(
          radius: radiusSmall,
          backgroundColor: kButtonsColor,
        )
      ],
    );
  }
}
