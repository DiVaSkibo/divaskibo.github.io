import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/__widgets.dart';

class SkillsCard extends StatelessWidget {
  final String title;
  final Map<String, Level?> skills;

  const SkillsCard({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return buildCard(
      width: 333.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Styles.header),
          dividerMain,
          Column(
            spacing: 9,
            children: [
              for (final skill in skills.entries)
                Row(
                  children: [
                    Text(skill.key),
                    const Spacer(),
                    if (skill.value != null) buildLevel(skill.value!),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
