import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/list.dart';
import 'pages/grade.dart';
import 'pages/mine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final _bottomIconColor = Colors.indigo;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(const HomePage())
      ..add(const ListPage())
      ..add(const GradePage())
      ..add(const MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _bottomIconColor), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list, color: _bottomIconColor), label: 'List'),
            BottomNavigationBarItem(
                icon: Icon(Icons.grade, color: _bottomIconColor),
                label: 'Grade'),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_ind, color: _bottomIconColor),
                label: 'Mine'),
          ],
          currentIndex: _currentIndex,
          fixedColor: _bottomIconColor,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: list[_currentIndex]);
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
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
