import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  const ExpansionTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expantion Tile Demo'),
        ),
        backgroundColor: Colors.white12,
        body: const ExpansionTile(
          title: Text('Expansion Tile'),
          leading: Icon(Icons.ac_unit),
          initiallyExpanded: true,
          textColor: Colors.cyan,
          iconColor: Colors.cyan,
          collapsedIconColor: Colors.white,
          collapsedTextColor: Colors.white,
          children: [
            ListTile(
                title: Text(
              'main title',
              style: TextStyle(
                color: Colors.white,
              ),
            )),
            ListTile(
                title: Text(
              'sub title',
              style: TextStyle(color: Colors.white),
            ))
          ],
        ));
  }
}
