import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/cards.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 36,
            runSpacing: 36,
            children: [
              SkillsCard(
                title: 'Languages',
                skills: {
                  'English': LanguageLevel.intermediate,
                  'Ukrainian': LanguageLevel.fluent,
                  'Russian': LanguageLevel.upperIntermediate,
                  'Polish': LanguageLevel.elementary,
                },
              ),
              SkillsCard(
                title: 'Soft skills',
                skills: {
                  'Creativity': null,
                  'Problem-solving': null,
                  'Teamwork': null,
                  'Leadership': null,
                  'Communication': null,
                  'Attention to Detail': null,
                  'Adaptability': null,
                },
              ),
              SkillsCard(
                title: 'Hard skills',
                skills: {
                  'c++': HardLevel.expert,
                  'c#': HardLevel.advanced,
                  'python': HardLevel.advanced,
                  'Swift': HardLevel.beginner,
                  'Kotlin': HardLevel.beginner,
                  'Dart': HardLevel.guru,
                  'Rust': HardLevel.beginner,
                  'HTML': HardLevel.intermediate,
                  'CSS': HardLevel.intermediate,
                  'JavaScript': HardLevel.intermediate,
                  'TypeScript': HardLevel.beginner,
                  'GodotScript': HardLevel.guru,
                  'gleam': HardLevel.beginner,

                  'SQL': HardLevel.intermediate,
                  'NoSQL': HardLevel.advanced,
                  'Firebase': HardLevel.advanced,

                  'raylib': HardLevel.intermediate,
                  'CustomTkinter': HardLevel.advanced,
                  'Flutter': HardLevel.advanced,
                  'Godot': HardLevel.expert,
                  'Unity': HardLevel.beginner,

                  'git': HardLevel.advanced,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
