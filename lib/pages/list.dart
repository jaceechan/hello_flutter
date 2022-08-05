import 'package:hello_flutter/pages/expansion_tile.dart';
import 'package:hello_flutter/pages/expansion_list.dart';
import 'package:hello_flutter/pages/flow_layout.dart';
import 'package:hello_flutter/pages/search_bar.dart';
import 'package:hello_flutter/pages/route_demos.dart';
import 'package:hello_flutter/pages/frosted_glass.dart';
import 'package:hello_flutter/pages/keep_alive.dart';
import 'package:hello_flutter/pages/custom_clipper.dart';
import 'package:hello_flutter/pages/right_back.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget divider = const Divider(color: Colors.black26);
    final items = [
      {'title': '路由动画', 'route': const RouteDemos()},
      {'title': '毛玻璃效果', 'route': const FrostedGlassDemo()},
      {'title': '保持页面状态', 'route': const KeepAliveDemo()},
      {'title': '搜索栏', 'route': const SearchBarDemo()},
      {'title': '流式布局', 'route': const FlowLayoutDemo()},
      {'title': '展开闭合', 'route': const ExpansionTileDemo()},
      {'title': '展开闭合列表', 'route': const ExpansionListDemo()},
      {'title': '贝塞尔曲线切割', 'route': const CustomClipperDemo()},
      {'title': '右滑返回', 'route': const RightBackDemo()},
    ];
    return Scaffold(
        appBar: AppBar(title: const Text('Demos')),
        body: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          separatorBuilder: (BuildContext context, int index) {
            return divider;
          },
          itemCount: items.length,
          itemBuilder: (BuildContext builderContext, int index) {
            Map item = items[index];
            String title = item['title'];

            return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return item['route'];
                    }),
                  );
                },
                title: Text(title));
          },
        ));
  }
}
