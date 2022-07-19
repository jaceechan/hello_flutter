import 'package:flutter/material.dart';

const searchList = [
  'flutter',
  'uni-app',
  'taro',
  'react-native',
  'weex',
  'react'
];

const recentSuggest = ["推荐-1", "推荐-2"];

class SearchBarDemo extends StatefulWidget {
  const SearchBarDemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<SearchBarDemo> createState() => _SearchBarDemoState();
}

class _SearchBarDemoState extends State<SearchBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SeachBar Demo'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}

class SearchBarDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(child: Text(query)),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) => ListTile(
              title: RichText(
                  text: TextSpan(
                      text: suggestionList[index].substring(0, query.length),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                        text: suggestionList[index].substring(query.length),
                        style: const TextStyle(color: Colors.grey))
                  ])),
            ));
  }
}
