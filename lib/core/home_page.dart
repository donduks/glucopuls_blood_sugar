import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/core/providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Get the saved name
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $name '),
        centerTitle: true,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return const Center(
      child: Text(''),
    );
  }
}
