import 'package:flutter/material.dart';

class FlowLayoutDemo extends StatefulWidget {
  const FlowLayoutDemo({super.key});

  @override
  State<FlowLayoutDemo> createState() => _FlowLayoutDemoState();
}

class _FlowLayoutDemoState extends State<FlowLayoutDemo> {
  late List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = <Widget>[buildAddButton()];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flow Layout Demo'),
      ),
      body: Container(
        width: width,
        height: height / 2,
        color: Colors.blue[50],
        child: Wrap(
          spacing: 5.0,
          children: items,
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        if (items.length < 9) {
          setState(() {
            items.insert(items.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.grey,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.indigo,
        child: const Center(
            child: Text(
          '照片',
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
