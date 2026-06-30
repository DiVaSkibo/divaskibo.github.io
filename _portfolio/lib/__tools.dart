import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

enum Level {
  beginner,
  elementary,
  intermediate,
  upperIntermediate,
  advanced,
  expert,
  fluent,
  guru;

  String get label => switch (this) {
    beginner => 'Beginner',
    elementary => 'Elementary',
    intermediate => 'Intermediate',
    upperIntermediate => 'Upper-Intermediate',
    advanced => 'Advanced',
    expert => 'Expert',
    guru => 'Guru',
    fluent => 'Fluent',
  };
  Color get colour => switch (this) {
    beginner => Colours.beginner,
    elementary => Colours.elementary,
    intermediate => Colours.intermediate,
    upperIntermediate => Colours.upperIntermediate,
    advanced => Colours.advanced,
    expert => Colours.expert,
    guru => Colours.guru,
    fluent => Colours.fluent,
  };
}

enum CVPage {
  person,
  skills,
  experience,
  projects;

  String get label => name;
  IconData get icon => switch (this) {
    person => Icons.accessibility_new,
    skills => Icons.sports_gymnastics,
    experience => Icons.self_improvement,
    projects => Icons.sports_handball,
  };
}

final class Fonts {
  static const String basic = 'Rubik';
  static const String caps = 'Rubik Mono One';
  static const String shadow = 'Rubik Doodle Shadow';
}

final class Colours {
  static const Color main = Color(0xFF35225C);
  static const Color mainShade = Color(0xFF241345);
  static const Color accent = Color(0xFF00FFAA);
  static const Color accentShade = Color(0xFF092E22);
  static const Color notation = Color(0xFF7A67A1);

  static const Color beginner = Color(0xFFFFA64D);
  static const Color elementary = Color(0xFFE1FF4C);
  static const Color intermediate = Color(0xFFE1FF4C);
  static const Color upperIntermediate = Color(0xFF4CFF6A);
  static const Color advanced = Color(0xFF4CFFFF);
  static const Color expert = Color(0xFF4CFF6A);
  static const Color guru = Color(0xFFFF4DA6);
  static const Color fluent = Color(0xFFFF4DA6);
}

final class Styles {
  static const TextStyle basic = TextStyle(
    fontFamily: Fonts.basic,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle header = TextStyle(
    fontFamily: Fonts.shadow,
    fontSize: 36,
  );
  static const TextStyle description = TextStyle(
    fontFamily: Fonts.basic,
    fontWeight: FontWeight.w300,
    fontSize: 15,
  );
  static const TextStyle note = TextStyle(
    fontFamily: Fonts.basic,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
    color: Colours.notation,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: Fonts.basic,
    fontWeight: FontWeight.w300,
    fontSize: 18,
  );
}
