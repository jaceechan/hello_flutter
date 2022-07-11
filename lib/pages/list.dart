import './route_demos.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget divider = const Divider(color: Colors.black26);

    return Scaffold(
        appBar: AppBar(title: const Text('Demos')),
        body: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          separatorBuilder: (BuildContext context, int index) {
            return divider;
          },
          itemCount: 50,
          itemBuilder: (BuildContext builderContext, int index) {
            return ListTile(
                onTap: () {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const RouteDemos();
                      }),
                    );
                  } else {
                    print('点击 示例$index');
                  }
                },
                title: index > 0 ? Text('示例$index') : const Text('路由动画'));
          },
        ));
  }
}
