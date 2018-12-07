import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/models/prompt.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';
import 'package:writing_prompt/presentation/styles/text_styles.dart';

class WritingPromptApp extends StatelessWidget {
  final PromptBloc bloc;

  WritingPromptApp({
    Key key,
    this.bloc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
             primaryColor: titleBarBackground,
      ),
      home: MyHomePage(title: 'Writing Prompt', bloc: bloc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final PromptBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: titleBarTextStyle(),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.refresh),
          onPressed: (() => widget.bloc.fetchPrompt())
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(screenPadding),
          child: StreamBuilder<Prompt>(
            stream: widget.bloc.prompt,
            builder: (context, snapshot) =>
                Text(
                  snapshot.data == null ? "N/A" : snapshot.data.prompt,
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