import 'package:rxdart/rxdart.dart';
import 'package:writing_prompt/data/local/database/prompt_provider.dart';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/domain/mapper/prompt_mappers.dart';
import 'package:writing_prompt/domain/models/prompt.dart';

class PromptManager {
  PromptApi _api;
  PromptRemoteMapper _remoteMapper;
  PromptLocalInverseMapper _localInverseMapper;
  PromptLocalMapper _localMapper;
  DBHelper _dbHelper;

  PromptManager(this._api, this._remoteMapper, this._localInverseMapper, this._localMapper, this._dbHelper);

  Observable<Prompt> getPrompt() =>
      Observable.fromFuture(_api.fetchPrompt())
          .map((article) => _remoteMapper.map(article));

  Observable<int> insertPrompt(Prompt prompt) =>
      Observable.fromFuture(
          _dbHelper.insert(_localInverseMapper.map(prompt))
      );

  Observable<List<Prompt>> getListOfPrompts() =>
      Observable.fromFuture(_dbHelper.getPrompts())
      .map((prompts) => _localMapper.mapList(prompts));

  Observable<int> updatePrompt(Prompt prompt) {
    var local = _localInverseMapper.map(prompt);
    return Observable.fromFuture(
        _dbHelper.update(local)
    );
  }
}