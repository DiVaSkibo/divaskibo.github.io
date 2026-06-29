import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/__widgets.dart';
import 'package:_portfolio/_skill_card.dart';
import 'package:flutter/material.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 36,
            runSpacing: 36,
            children: [
              SkillCard(
                title: 'Hard skills :',
                body: [
                  Attribute(text: 'C++', level: Level.expert),
                  Attribute(text: 'C#', level: Level.intermediate),
                  Attribute(text: 'Python', level: Level.advanced),
                  Attribute(text: 'Swift', level: Level.beginner),
                  Attribute(text: 'Kotlin', level: Level.beginner),
                  Attribute(text: 'HTML', level: Level.advanced),
                  Attribute(text: 'CSS', level: Level.advanced),
                  Attribute(text: 'JavaScript', level: Level.intermediate),
                  Attribute(text: 'Dart', level: Level.advanced),
                  Attribute(text: 'Flutter', level: Level.advanced),
                  Attribute(text: 'GodotScript', level: Level.expert),
                  Attribute(text: 'Git', level: Level.advanced),
                ],
              ),
              SkillCard(
                title: 'Soft skills :',
                body: [
                  Attribute(text: 'Creativity'),
                  Attribute(text: 'Problem-solving'),
                  Attribute(text: 'Teamwork'),
                  Attribute(text: 'Leadership'),
                  Attribute(text: 'Communication'),
                  Attribute(text: 'Attention to Detail'),
                  Attribute(text: 'Adaptability'),
                ],
              ),
              SkillCard(
                title: 'Languages :',
                body: [
                  Attribute(text: 'Ukrainian', level: Level.fluent),
                  Attribute(text: 'English', level: Level.intermediate),
                  Attribute(text: 'Russian', level: Level.upperIntermediate),
                  Attribute(text: 'Polish', level: Level.intermediate),
                ],
              ),
              SkillCard(
                title: 'Tools :',
                body: [
                  Attribute(text: 'Miro'),
                  Attribute(text: 'Figma'),
                  Attribute(text: 'Krita'),
                  Attribute(text: 'GitHub'),
                  Attribute(text: 'GodotEngine'),
                  Attribute(text: 'Visual Studio Code'),
                  Attribute(text: 'FL Studio'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
