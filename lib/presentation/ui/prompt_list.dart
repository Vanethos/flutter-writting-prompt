import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/models/prompt.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';
import 'package:writing_prompt/presentation/styles/text_styles.dart';
import 'package:writing_prompt/presentation/utils/refrexh_button.dart';

class PromptListPage extends StatefulWidget {
  final PromptBloc bloc;

  PromptListPage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;

  @override
  _PromptListPageState createState() => _PromptListPageState();
}

class _PromptListPageState extends State<PromptListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: titleBarTextStyle(),),
        elevation: 0.0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(screenPadding),
          child: StreamBuilder<Prompt>(
            stream: widget.bloc.prompt,
            builder: (context, snapshot) =>
                Text(
                  "Second screen",
                  style: promptTextStyle(),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      ),
      backgroundColor: titleBarBackground,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}