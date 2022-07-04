import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MinePage')),
      body: const Center(child: Text('MinePage')),
    );
  }
}
