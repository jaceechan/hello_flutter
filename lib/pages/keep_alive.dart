import 'package:flutter/material.dart';

class KeepAliveDemo extends StatefulWidget {
  const KeepAliveDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<KeepAliveDemo> createState() => _KeepAliveDemoState();
}

class _KeepAliveDemoState extends State<KeepAliveDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keep Alive Demo'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.directions_bike)),
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
      ),
      body: TabBarView(controller: _controller, children: const [
        KeepAliveInside(title: 'A'),
        KeepAliveInside(title: 'B'),
        KeepAliveInside(title: 'C'),
      ]),
    );
  }
}

class KeepAliveInside extends StatefulWidget {
  const KeepAliveInside({Key? key, required this.title}) : super(key: key);

  final String title;

  // This widget is the root of your application.
  @override
  State<KeepAliveInside> createState() => _KeepAliveInsideState();
}

class _KeepAliveInsideState extends State<KeepAliveInside>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Tab-${widget.title}',
                  style: Theme.of(context).textTheme.headline5),
              Text('点一下加1:', style: Theme.of(context).textTheme.headline5),
              Text('$_counter', style: Theme.of(context).textTheme.headline3)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add',
          backgroundColor: Colors.indigo,
          onPressed: _incrementCounter,
          child: const Icon(Icons.add, color: Colors.white),
        ));
  }
}
