import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/person_page.dart';
import 'package:_portfolio/skill_page.dart';
import 'package:_portfolio/experience_page.dart';
import 'package:_portfolio/project_page.dart';
import 'package:floaty_nav_bar/floaty_nav_bar.dart';

class Rooter extends StatefulWidget {
  const Rooter({super.key});

  @override
  State<Rooter> createState() => _RooterState();
}

class _RooterState extends State<Rooter> {
  Pages _currentPage = Pages.person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_currentPage) {
        Pages.person => const PersonPage(),
        Pages.skills => const SkillsPage(),
        Pages.experience => const ExperiencePage(),
        Pages.projects => const ProjectsPage(),
      },
      bottomNavigationBar: FloatyNavBar(
        selectedTab: _currentPage.index,
        backgroundColor: ColorsTool.mainShade,
        tabs: [
          for (final page in Pages.values)
            FloatyTab(
              isSelected: _currentPage == page,
              title: page.label,
              icon: Icon(page.icon),
              onTap: () {
                if (page != _currentPage) setState(() => _currentPage = page);
              },
            ),
        ],
      ),
    );
  }
}
