import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';

class RefreshPrompt extends StatefulWidget {
  PromptBloc bloc;

  RefreshPrompt(this.bloc);

  @override
  _RefreshPromptState createState() => new _RefreshPromptState();
}

class _RefreshPromptState extends State<RefreshPrompt>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.addStatusListener((state) {
      if (state == AnimationStatus.completed) {
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new RotationTransition(
        turns: _animationController,
        child: IconButton(
        iconSize: refreshButtonSize,
        icon: Icon(Icons.refresh),
        onPressed: (() {
          widget.bloc.fetchPrompt();
          if (!_animationController.isAnimating) {
          _animationController.forward();
          }
      }))
    );
  }
}