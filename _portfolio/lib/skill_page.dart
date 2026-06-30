import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/_skill_card.dart';

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
              SkillsCard(
                title: 'Hard skills :',
                skills: {
                  'C++': Level.expert,
                  'C#': Level.intermediate,
                  'Python': Level.advanced,
                  'Swift': Level.beginner,
                  'Kotlin': Level.beginner,
                  'HTML': Level.advanced,
                  'CSS': Level.advanced,
                  'JavaScript': Level.intermediate,
                  'Dart': Level.advanced,
                  'Flutter': Level.advanced,
                  'GodotScript': Level.expert,
                  'Git': Level.advanced,
                },
              ),
              SkillsCard(
                title: 'Soft skills :',
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
                title: 'Languages :',
                skills: {
                  'Ukrainian': Level.fluent,
                  'English': Level.intermediate,
                  'Russian': Level.upperIntermediate,
                  'Polish': Level.intermediate,
                },
              ),
              SkillsCard(
                title: 'Tools :',
                skills: {
                  'Miro': null,
                  'Figma': null,
                  'Krita': null,
                  'GitHub': null,
                  'GodotEngine': null,
                  'Visual Studio Code': null,
                  'FL Studio': null,
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
