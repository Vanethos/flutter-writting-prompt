import 'package:test/test.dart';
import 'dart:async';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/data/remote/model/prompt_remote.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'package:writing_prompt/domain/mapper/prompt_mappers.dart';
import 'package:mockito/mockito.dart';
import 'package:writing_prompt/domain/models/prompt.dart';


import 'mocks.dart';

void main() {
  test("parse a simple Prompt object", () {
    const name = "name";
    const count = 10;
    const jsonString =
        '{"english": "$name", "count": $count}';

    expect(fromJson(jsonString).english, name);
    expect(fromJson(jsonString).count, count);
  });

  test("network testing", () async {
    PromptApi api = PromptApi();
    PromptRemote prompt = await api.fetchPrompt();
    expect(prompt.english, isNotNull);
    expect(prompt.count, isNotNull);
  });

  test("testing mapper", () {
    const name = "name";
    const count = 10;
    var mapper = PromptRemoteMapper();
    var promptRemote = MockPromptRemote();
    when(promptRemote.count).thenReturn(count);
    when(promptRemote.english).thenReturn(name);

    Prompt prompt = mapper.map(promptRemote);
    expect(prompt.count, count);
    expect(prompt.prompt, name);
  });

  test("manager test", () async {
    const name = "name";
    const count = 10;
    var remoteMapper = MockRemoteMapper();
    var api = MockApi();
    var localMapper = MockLocalMapper();
    var localInverseMapper = MockLocalInverseMapper();
    var db = MockDbHelper();

    var promptRemote = MockPromptRemote();
    when(promptRemote.count).thenReturn(count);
    when(promptRemote.english).thenReturn(name);

    when(api.fetchPrompt()).thenAnswer((_) => Future(() => promptRemote));
    var prompt = Prompt(name, count, false);
    when(remoteMapper.map(any)).thenReturn(prompt);

    var manager = PromptManager(api, remoteMapper, localInverseMapper, localMapper, db);

    manager.getPrompt().listen(
        expectAsync1((value) {
          expect(value.prompt, prompt.prompt);
        }, count: 1));
  });
}