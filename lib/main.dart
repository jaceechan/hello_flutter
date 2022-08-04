import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/list.dart';
import 'pages/grade.dart';
import 'pages/mine.dart';
import 'pages/splash_screen.dart';

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
        primarySwatch: Colors.indigo,
      ),
      // home: const CustomBottomPage(title: 'Flutter Demo'),
      home: const SplashScreenDemo(),
    );
  }
}

// 一般底部导航
class NormalBottomPage extends StatefulWidget {
  const NormalBottomPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NormalBottomPage> createState() => _NormalBottomPageState();
}

class _NormalBottomPageState extends State<NormalBottomPage> {
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

// 自定义不规则底部导航
// class CustomBottomPage extends StatefulWidget {
//   const CustomBottomPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<CustomBottomPage> createState() => _CustomBottomPageState();
// }

// class _CustomBottomPageState extends State<CustomBottomPage> {
//   int _currentIndex = 0;
//   final _bottomIconColor = Colors.indigo;
//   List<Widget> list = [];

//   @override
//   void initState() {
//     list
//       ..add(const ListPage())
//       ..add(const MinePage());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           var result = Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) {
//               return const NewPage(
//                   // 路由传参
//                   text: 'NewPage');
//             }),
//           );
//           print("路由返回值: $result");
//         },
//         tooltip: 'Add',
//         backgroundColor: _bottomIconColor,
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         color: _bottomIconColor,
//         shape: const CircularNotchedRectangle(),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 0;
//                   });
//                 },
//                 icon: const Icon(
//                   Icons.home,
//                   color: Colors.white,
//                 )),
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _currentIndex = 1;
//                   });
//                 },
//                 icon: const Icon(
//                   Icons.assignment_ind,
//                   color: Colors.white,
//                 )),
//           ],
//         ),
//       ),
//       body: list[_currentIndex],
//     );
//   }
// }

// class NewPage extends StatelessWidget {
//   const NewPage({Key? key, required this.text}) : super(key: key);

//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("New page"),
//       ),
//       body: Center(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//             const Text("This is new route haha"),
//             Text(text),
//             ElevatedButton(
//               child: const Text("back"),
//               onPressed: () {
//                 Navigator.pop(context, '我是返回值');
//               },
//             )
//           ])),
//     );
//   }
// }
