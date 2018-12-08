import 'dart:convert' as json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:writing_prompt/data/remote/serializers/serializers.dart';

part 'prompt_remote.g.dart';

// we need to run in the terminal:
// flutter packages pub run build_runner watch

abstract class PromptRemote implements Built<PromptRemote, PromptRemoteBuilder> {
  static Serializer<PromptRemote> get serializer => _$promptRemoteSerializer;

  String get english;

  int get count;

  PromptRemote._();

  factory PromptRemote([updates(PromptRemoteBuilder b)]) = _$PromptRemote;
}

PromptRemote fromJson(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  PromptRemote article = standardSerializers.deserializeWith(PromptRemote.serializer, parsed);
  return article;
}
