import 'package:flutter/material.dart';

class ExpansionListDemo extends StatefulWidget {
  const ExpansionListDemo({super.key});

  @override
  State<ExpansionListDemo> createState() => _ExpansionListDemoState();
}

class _ExpansionListDemoState extends State<ExpansionListDemo> {
  late List<int> mList;
  late List<ExpandStateBean> expandStateList;

  _ExpansionListDemoState() {
    mList = [];
    expandStateList = [];

    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrent(int index, isExpanded) {
    setState(() {
      for (var item in expandStateList) {
        if (item.index == index) {
          item.isOpen = !isExpanded;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expansion List Demo')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrent(index, bol);
          },
          children: mList.map((index) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text('This is No.$index'),
                  );
                },
                body: ListTile(
                  title: Text('expandsion no.$index'),
                ),
                isExpanded: expandStateList[index].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index, this.isOpen);
}
