import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/presentation/styles/strings.dart';
import 'package:writing_prompt/presentation/ui/prompt_list.dart';
import 'package:writing_prompt/presentation/ui/single_prompt.dart';

class HomePage extends StatefulWidget {
  final PromptBloc bloc;

  HomePage({Key key, this.bloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    if (_children.isEmpty) {
      buildChildren(context);
    }
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text(navigationSinglePrompt),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text(navigationPromptList),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void buildChildren(BuildContext context) {
    _children = [
      SinglePromptPage(bloc: widget.bloc, title: appName),
      PromptListPage(bloc: widget.bloc, title: appName),
    ];
  }
}