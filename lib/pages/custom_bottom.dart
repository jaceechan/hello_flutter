import 'package:flutter/material.dart';
import 'list.dart';
import 'mine.dart';

// 自定义不规则底部导航
class CustomBottomPage extends StatefulWidget {
  const CustomBottomPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CustomBottomPage> createState() => _CustomBottomPageState();
}

class _CustomBottomPageState extends State<CustomBottomPage> {
  int _currentIndex = 0;
  final _bottomIconColor = Colors.indigo;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(const ListPage())
      ..add(const MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const NewPage(
                  // 路由传参
                  text: 'NewPage');
            }),
          );
          print("路由返回值: $result");
        },
        tooltip: 'Add',
        backgroundColor: _bottomIconColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: _bottomIconColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: const Icon(
                  Icons.assignment_ind,
                  color: Colors.white,
                )),
          ],
        ),
      ),
      body: list[_currentIndex],
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New page"),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text("This is new route haha"),
            Text(text),
            ElevatedButton(
              child: const Text("back"),
              onPressed: () {
                Navigator.pop(context, '我是返回值');
              },
            )
          ])),
    );
  }
}
