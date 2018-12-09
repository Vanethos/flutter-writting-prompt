import 'package:rxdart/rxdart.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'dart:async';

import 'package:writing_prompt/domain/models/prompt.dart';

class PromptBloc {
  PromptManager _promptManager;

  final _promptSubject = BehaviorSubject<Prompt>();
  final _promptHistorySubject = BehaviorSubject<List<Prompt>>();
  final _promptUpdateSubject = PublishSubject<Prompt>();
  final _promptInsertSubject = PublishSubject<Prompt>();
  final _fetchPromptSubject = PublishSubject<int>();



  Stream<Prompt> get prompt => _promptSubject.stream;
  Stream<List<Prompt>> get promptHistory => _promptHistorySubject.stream;
  Sink<Prompt> get promptUpdate => _promptUpdateSubject.sink;
  Sink<Prompt> get promptInsert => _promptInsertSubject.sink;
  Sink<int> get fetchPrompt => _fetchPromptSubject.sink;

  PromptBloc(this._promptManager) {
    _getPromptHistory();

    _promptUpdateSubject
        .listen(_updatePrompt);

    _promptInsertSubject
      .listen(_insertPrompt);

    _fetchPromptSubject
      .listen((_) => _fetchPrompt());

    // fetches first prompt
    fetchPrompt.add(0);
  }

  void _updatePrompt(Prompt prompt) {
    _promptManager.updatePrompt(prompt)
        .listen((_) => _);
  }

  void _insertPrompt(Prompt prompt) {
    _promptManager.insertPrompt(prompt)
        .flatMap((_) => _getPromptHistory())
        .listen((_) => _);
  }

  Observable<List<Prompt>> _getPromptHistory() {
    return _promptManager.getListOfPrompts()
        .map((prompts) => prompts.reversed.toList())
        .map(_addHistoryToSubject);
  }

  List<Prompt> _addHistoryToSubject(List<Prompt> prompts) {
    _promptHistorySubject.add(prompts);
    return prompts;
  }

  void _fetchPrompt() {
    _promptManager.getPrompt()
        .map((prompt) {
          _promptSubject.add(prompt);
          return prompt;
        })
        .listen(_promptInsertSubject.add);
  }
}