import 'package:flutter/material.dart';
import 'package:mood_diary/utils/assets.dart';

enum Feels{
  joy,
  fear,
  rabies,
  sadness,
  calm,
  force;

  Widget get asImages{
    switch(this){
      case Feels.joy:
        return AppIcons.joy.pngPicture;
      case Feels.fear:
        return AppIcons.fear.pngPicture;
      case Feels.rabies:
        return AppIcons.rabies.pngPicture;
      case Feels.sadness:
        return AppIcons.sadness.pngPicture;
      case Feels.calm:
        return AppIcons.calm.pngPicture;
      case Feels.force:
        return AppIcons.force.pngPicture;
    }
  }

  String get asValue{
    switch(this){
      case Feels.joy:
        return 'Радость';
      case Feels.fear:
        return 'Страх';
      case Feels.rabies:
        return 'Бешенство';
      case Feels.sadness:
        return 'Грусть';
      case Feels.calm:
        return 'Спокойствие';
      case Feels.force:
        return 'Сила';
    }
  }
}
