import 'package:flutter/material.dart';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'package:writing_prompt/domain/mapper/prompt_mapper.dart';
import 'package:writing_prompt/presentation/ui/home.dart';

void main() {
  // poor-man's injection
  var mapper = PromptMapper();
  var api = PromptApi();
  var manager = PromptManager(api, mapper);
  var bloc = PromptBloc(manager);
  runApp(WritingPromptApp(bloc: bloc));
}
