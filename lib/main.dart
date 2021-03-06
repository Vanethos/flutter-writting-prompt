import 'package:flutter/material.dart';
import 'package:writing_prompt/data/local/database/prompt_provider.dart';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'package:writing_prompt/domain/mapper/prompt_mappers.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/strings.dart';
import 'package:writing_prompt/presentation/ui/home.dart';
import 'package:writing_prompt/presentation/ui/single_prompt.dart';

void main() {
  // poor-man's injection
  var _remoteMapper = PromptRemoteMapper();
  var _localInverseMapper = PromptLocalInverseMapper();
  var _localMapper = PromptLocalMapper();
  var _dbHelper = DBHelper();
  var _api = PromptApi();
  var _manager = PromptManager(_api, _remoteMapper, _localInverseMapper, _localMapper, _dbHelper);
  var _bloc = PromptBloc(_manager);
  runApp(WritingPromptApp(bloc: _bloc));
}

class WritingPromptApp extends StatelessWidget {
  final PromptBloc bloc;

  WritingPromptApp({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        scaffoldBackgroundColor: titleBarBackground,
        canvasColor: bottomBarBackground,
        primaryColor: titleBarBackground,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white54),
              subhead: TextStyle(fontFamily: 'Garamond', fontSize: 10.0))
      ),
      home: HomePage(bloc: bloc),
    );
  }
}