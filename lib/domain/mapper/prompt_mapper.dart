import 'package:writing_prompt/common/mapper.dart';
import 'package:writing_prompt/data/model/prompt_remote.dart';
import 'package:writing_prompt/domain/models/prompt.dart';

class PromptMapper extends Mapper<PromptRemote, Prompt> {
  @override
  Prompt map(PromptRemote value) {
    return new Prompt(value.english, value.count);
  }
}

