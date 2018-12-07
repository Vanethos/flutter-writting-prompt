import 'package:flutter/material.dart';
import 'package:writing_prompt/domain/bloc/prompt_bloc.dart';

class ImageRotate extends StatefulWidget {
  PromptBloc bloc;

  ImageRotate(this.bloc);

  @override
  _ImageRotateState createState() => new _ImageRotateState();
}

class _ImageRotateState extends State<ImageRotate>
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
    return new Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: new RotationTransition(
        turns: _animationController,
        child: IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (() {
              widget.bloc.fetchPrompt();
              if (!_animationController.isAnimating) {
                _animationController.forward();
              }
            })
        ),
      ),
    );
  }
}