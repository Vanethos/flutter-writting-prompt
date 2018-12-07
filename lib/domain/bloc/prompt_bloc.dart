import 'package:rxdart/rxdart.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'dart:async';

import 'package:writing_prompt/domain/models/prompt.dart';

class PromptBloc {
  PromptManager _promptManager;

  final _promptSubject = BehaviorSubject<Prompt>();

  Stream<Prompt> get prompt => _promptSubject.stream;

  PromptBloc(this._promptManager) {
    fetchPrompt();
  }

  void fetchPrompt() {
    _promptManager.getPrompt()
        .listen(_promptSubject.add);
  }
}