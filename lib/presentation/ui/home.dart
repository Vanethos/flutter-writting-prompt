import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/models/prompt.dart';

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
             primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', bloc: bloc),
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
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<Prompt>(
          stream: widget.bloc.prompt,
          builder: (context, snapshot) =>
              Text(snapshot.data == null ? "N/A" : snapshot.data.prompt),
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}