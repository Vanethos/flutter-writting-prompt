import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/models/prompt.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';
import 'package:writing_prompt/presentation/styles/text_styles.dart';

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
          child: StreamBuilder<List<Prompt>>(
            stream: widget.bloc.promptHistory,
            builder: (context, snapshot) =>
              snapshot.data == null ? Text("No Entries") :
                ListView(
                  children: snapshot.data.map(_buildItem).toList(),
                ),
          ),
        ),
      ),
      backgroundColor: titleBarBackground,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildItem(Prompt prompt) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: screenPadding, right: screenPadding, bottom: listPadding, top: listPadding),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Text(prompt.prompt)
            ),
            Checkbox(
                value: prompt.done == null ? false : prompt.done,
                onChanged: (bool newValue) {
                  setState(() {
                    prompt.done = newValue;
                  });
                }
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: new Border(
              bottom: new BorderSide()
          )
      ),
    );
  }
}