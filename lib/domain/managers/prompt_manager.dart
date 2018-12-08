import 'package:rxdart/rxdart.dart';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/domain/mapper/prompt_mapper.dart';
import 'package:writing_prompt/domain/models/prompt.dart';

class PromptManager {
  PromptApi api;
  PromptMapper mapper;

  PromptManager(this.api, this.mapper);

  Observable<Prompt> getPrompt() {
    return Observable.fromFuture(api.fetchPrompt())
        .map((article) => mapper.map(article));
  }
}