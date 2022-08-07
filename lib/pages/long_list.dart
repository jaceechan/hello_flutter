import 'package:flutter/material.dart';

class LongListDemo extends StatelessWidget {
  LongListDemo({super.key});

  final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    const title = 'Long List Demo';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.network(
                    'https://picsum.photos/id/$index/200/200',
                    width: 100.0,
                    height: 100.0,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        items[index],
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
