import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/core/bottom_navigation_bar.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
        home: const BottomNavBar());
  }
}
