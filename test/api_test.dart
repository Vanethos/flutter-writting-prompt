import 'package:rxdart/rxdart.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'package:writing_prompt/data/api/prompt_api.dart';
import 'package:writing_prompt/data/model/prompt_remote.dart';
import 'package:writing_prompt/domain/managers/prompt_manager.dart';
import 'package:writing_prompt/domain/mapper/prompt_mapper.dart';
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
    var mapper = PromptMapper();
    var promptRemote = MockPromptRemote();
    when(promptRemote.count).thenReturn(count);
    when(promptRemote.english).thenReturn(name);

    Prompt prompt = mapper.map(promptRemote);
    expect(prompt.count, count);
    expect(prompt.prompt, name);
  });
}