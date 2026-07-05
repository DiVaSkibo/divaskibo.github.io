import 'package:flutter/material.dart';
export 'package:flutter/material.dart';

mixin Leveling on Enum {
  String get label;
  Color get colour;
}

enum LanguageLevel with Leveling {
  beginner,
  elementary,
  intermediate,
  upperIntermediate,
  advanced,
  proficient,
  fluent;

  @override
  String get label => switch (this) {
    beginner => 'Beginner',
    elementary => 'Elementary',
    intermediate => 'Intermediate',
    upperIntermediate => 'Upper-Intermediate',
    advanced => 'Advanced',
    proficient => 'Proficient',
    fluent => 'Fluent',
  };
  @override
  Color get colour => switch (this) {
    beginner => Colours.veryLow,
    elementary => Colours.low,
    intermediate => Colours.medium,
    upperIntermediate => Colours.high,
    advanced => Colours.veryHigh,
    proficient => Colours.peak,
    fluent => Colours.peak,
  };
}

enum HardLevel with Leveling {
  beginner,
  intermediate,
  advanced,
  expert,
  guru;

  @override
  String get label => switch (this) {
    beginner => 'Beginner',
    intermediate => 'Intermediate',
    advanced => 'Advanced',
    expert => 'Expert',
    guru => 'Guru',
  };
  @override
  Color get colour => switch (this) {
    beginner => Colours.veryLow,
    intermediate => Colours.low,
    advanced => Colours.medium,
    expert => Colours.high,
    guru => Colours.veryHigh,
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

enum Linktype {
  email,
  telegram,
  linkedin,
  discord,
  github,
  itch,
  music,
  cosmos;

  IconData get icon => switch (this) {
    email => Icons.email,
    telegram => Icons.telegram,
    linkedin => Icons.info,
    discord => Icons.discord,
    github => Icons.commit,
    itch => Icons.sports_esports,
    music => Icons.music_note,
    cosmos => Icons.auto_awesome,
  };
}

abstract final class Fonts {
  static const String basic = 'Rubik';
  static const String caps = 'Rubik Mono One';
  static const String glitch = 'Rubik Glitch';
  static const String shadow = 'Rubik Doodle Shadow';

  const Fonts._();
}

abstract final class Colours {
  static const Color main = Color(0xFF_223F5C);
  static const Color mainKid = Color(0xFF_35225C);
  static const Color mainShade = Color(0xFF_132C45);
  static const Color mainShadeKid = Color(0xFF_241345);
  static const Color accent = Color(0xFF_00FFD4);
  static const Color accentKid = Color(0xFF_00FFAA);
  static const Color accentShade = Color(0xFF_092E28);
  static const Color accentShadeKid = Color(0xFF_092E22);
  static const Color notation = Color(0xFF_6784A1);
  static const Color notationKid = Color(0xFF_7A67A1);

  static const Color veryLow = Color(0xFF_FFA64D);
  static const Color low = Color(0xFF_E1FF4C);
  static const Color medium = Color(0xFF_4CFF6A);
  static const Color high = Color(0xFF_4CFFFF);
  static const Color veryHigh = Color(0xFF_6A4CFF);
  static const Color peak = Color(0xFF_FF4DA6);

  const Colours._();
}

abstract final class Styles {
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
