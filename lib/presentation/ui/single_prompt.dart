import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/models/prompt.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';
import 'package:writing_prompt/presentation/styles/text_styles.dart';
import 'package:writing_prompt/presentation/utils/refresh_button.dart';

class SinglePromptPage extends StatefulWidget {
  final PromptBloc bloc;

  SinglePromptPage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;

  @override
  _SinglePromptPageState createState() => _SinglePromptPageState();
}

class _SinglePromptPageState extends State<SinglePromptPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: titleBarTextStyle(),),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(screenPadding),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: StreamBuilder<Prompt>(
                  stream: widget.bloc.prompt,
                  builder: (context, snapshot) =>
                      Text(
                        snapshot.data == null ? "N/A" : snapshot.data.prompt,
                        style: promptTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                ),
                alignment: Alignment(0, 1),
              ),
            ),
            Expanded(
                child: Container(
                    child: RefreshPrompt(widget.bloc),
                    alignment: Alignment(0, -1),
                ),
            ),
          ],
        ),
      ),
       backgroundColor: titleBarBackground,
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}