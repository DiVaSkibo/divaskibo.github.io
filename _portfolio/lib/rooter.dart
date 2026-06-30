import 'package:floaty_nav_bar/floaty_nav_bar.dart';
import 'package:_portfolio/tools.dart';
import 'package:_portfolio/_pages.dart';

class Rooter extends StatefulWidget {
  const Rooter({super.key});

  @override
  State<Rooter> createState() => _RooterState();
}

class _RooterState extends State<Rooter> {
  CVPage _currentPage = CVPage.person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: switch (_currentPage) {
        CVPage.person => const PersonPage(),
        CVPage.skills => const SkillsPage(),
        CVPage.experience => const ExperiencePage(),
        CVPage.projects => const ProjectsPage(),
      },
      bottomNavigationBar: FloatyNavBar(
        height: 50.0,
        selectedTab: _currentPage.index,
        backgroundColor: Colours.mainShade,
        tabs: [
          for (final page in CVPage.values)
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
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => setState(() {}),
        child: const Icon(Icons.theater_comedy),
      ),
    );
  }
}
