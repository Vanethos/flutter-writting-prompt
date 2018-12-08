import 'package:flutter/material.dart';
import 'package:writing_prompt/presentation/styles/colors.dart';
import 'package:writing_prompt/presentation/styles/dimensions.dart';

TextStyle promptTextStyle() =>
  TextStyle(
    color: promptTextColor,
    fontSize: promptTextSize,
    fontStyle: FontStyle.italic,
  );

TextStyle titleBarTextStyle() =>
  TextStyle(
    color: titleBarTextColor,
  );

