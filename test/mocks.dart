import 'package:writing_prompt/data/local/database/prompt_provider.dart';
import 'package:writing_prompt/data/remote/api/prompt_api.dart';
import 'package:writing_prompt/data/remote/model/prompt_remote.dart';
import 'package:mockito/mockito.dart';
import 'package:writing_prompt/domain/mapper/prompt_mappers.dart';

class MockPromptRemote extends Mock implements PromptRemote {}
class MockRemoteMapper extends Mock implements PromptRemoteMapper {}
class MockLocalMapper extends Mock implements PromptLocalMapper {}
class MockLocalInverseMapper extends Mock implements PromptLocalInverseMapper {}
class MockDbHelper extends Mock implements DBHelper {}
class MockApi extends Mock implements PromptApi {}