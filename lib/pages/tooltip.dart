import 'package:flutter/material.dart';

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TooltipDemo')),
      body: Center(
          child: Tooltip(
        message: 'This is tooltip',
        waitDuration: const Duration(microseconds: 100),
        child: Image.network('https://picsum.photos/200/200'),
      )),
    );
  }
}
