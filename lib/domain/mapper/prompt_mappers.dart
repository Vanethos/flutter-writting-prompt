import 'package:writing_prompt/common/mapper.dart';
import 'package:writing_prompt/data/local/model/prompt_local.dart';
import 'package:writing_prompt/data/remote/model/prompt_remote.dart';
import 'package:writing_prompt/domain/models/prompt.dart';

class PromptRemoteMapper extends Mapper<PromptRemote, Prompt> {
  @override
  Prompt map(PromptRemote value) {
    return new Prompt(value.english, value.count);
  }
}

class PromptLocalInverseMapper extends Mapper<Prompt, PromptLocal> {
  @override
  PromptLocal map(Prompt value) {
    return new PromptLocal(value.count, value.prompt, false);
  }
}

class PromptLocalMapper extends Mapper<PromptLocal, Prompt> {
  @override
  Prompt map(PromptLocal value) {
    return new Prompt(value.prompt, value.id);
  }
}



