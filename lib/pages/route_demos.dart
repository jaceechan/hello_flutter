import 'package:flutter/material.dart';
import 'package:hello_flutter/routes/custom_route.dart';

class RouteDemos extends StatelessWidget {
  const RouteDemos({Key? key}) : super(key: key);

  final IconColor = Colors.indigo;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget divider = const Divider(color: Colors.black26);

    // return const Text('haha');

    return Scaffold(
        appBar: AppBar(title: const Text('路由动画')),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, //横轴三个子widget
                childAspectRatio: 1.0 //宽高比为1时，子widget
                ),
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: IconColor,
                    icon: const Icon(Icons.opacity),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomFadeRoute(const InsidePage()),
                      );
                    },
                  ),
                  Text(
                    '渐隐渐现',
                    style: TextStyle(
                      color: IconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: IconColor,
                    icon: const Icon(Icons.open_with),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomScaleRoute(const InsidePage()),
                      );
                    },
                  ),
                  Text(
                    '缩放动画',
                    style: TextStyle(
                      color: IconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: IconColor,
                    icon: const Icon(Icons.compare_arrows),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomSlideRoute(const InsidePage()),
                      );
                    },
                  ),
                  Text(
                    '左右滑动',
                    style: TextStyle(
                      color: IconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: IconColor,
                    icon: const Icon(Icons.wifi_protected_setup),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomRotationRoute(const InsidePage()),
                      );
                    },
                  ),
                  Text(
                    '旋转动画',
                    style: TextStyle(
                      color: IconColor,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    color: IconColor,
                    icon: const Icon(Icons.switch_access_shortcut),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CustomRotationScaleRoute(const InsidePage()),
                      );
                    },
                  ),
                  Text(
                    '旋转缩放',
                    style: TextStyle(
                      color: IconColor,
                    ),
                  )
                ],
              ),
            ]));
  }
}

class InsidePage extends StatelessWidget {
  const InsidePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        appBar: AppBar(
          title: const Text(
            'InsidePage',
            style: TextStyle(fontSize: 36.0),
          ),
          backgroundColor: Colors.pinkAccent,
          leading: Container(),
          elevation: 0.0,
        ),
        body: Center(
          child: MaterialButton(
            child: const Icon(Icons.navigate_before,
                color: Colors.white, size: 64.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ));
  }
}
