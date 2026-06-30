import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/cards.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 36,
            runSpacing: 36,
            children: [
              EventCard(
                event: 'Ctrl+Alt+Disinfo',
                role: 'Game Development, Music',
                experiences: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              EventCard(
                event: 'Snappy Gurus Game Off',
                role: 'Game Development, Music',
                experiences: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              EventCard(
                event: 'Global Game Jam 2024',
                role: 'Game Development, Music',
                experiences: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              EventCard(
                event: 'Global Game Jam 2023',
                role: '2D Art, 2D Animation, Music',
                experiences: [
                  'Designed 2D game using Krita;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
