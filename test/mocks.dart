import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/data/remote/model/prompt_remote.dart';
import 'package:mockito/mockito.dart';
import 'package:writing_prompt/domain/mapper/prompt_mapper.dart';

class MockPromptRemote extends Mock implements PromptRemote {}

class MockMapper extends Mock implements PromptMapper {}

class MockApi extends Mock implements PromptApi {}