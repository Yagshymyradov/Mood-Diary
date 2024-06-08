import 'package:flutter/material.dart';

extension BuildContectX on BuildContext{
  TextTheme get textTheme => Theme.of(this).textTheme;
}