import 'package:floaty_nav_bar/floaty_nav_bar.dart';
import 'package:_portfolio/tools.dart';
import 'package:_portfolio/_pages.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  bool _kid = true;
  CVPage _currentPage = CVPage.person;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: CVPage.values.length, vsync: this);
    _tabController.addListener(() {
      var newPage = CVPage.values[_tabController.index];
      if (_currentPage == newPage) return;
      setState(() {
        _currentPage = newPage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: Fonts.basic,
        colorScheme: ColorScheme.dark(
          primary: _kid ? Colours.mainShadeKid : Colours.mainShade,
        ),
        shadowColor: Colors.black,
        scaffoldBackgroundColor: _kid
            ? Colours.mainShadeKid
            : Colours.mainShade,
        textTheme: const TextTheme(bodyMedium: Styles.basic),
        iconTheme: IconThemeData(color: Colors.white),
        buttonTheme: ButtonThemeData(buttonColor: Colours.accentKid),
        dividerTheme: DividerThemeData(
          thickness: 3,
          color: _kid ? Colours.mainShadeKid : Colours.mainShade,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              _kid ? Colours.accentKid : Colours.accent,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(
              _kid ? Colours.notationKid : Colours.notation,
            ),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontFamily: Fonts.basic,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            visualDensity: VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            padding: WidgetStatePropertyAll(
              const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 1),
            ),
            backgroundColor: WidgetStatePropertyAll(
              _kid ? Colours.mainShadeKid : Colours.mainShade,
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: _kid ? Colours.mainShadeKid : Colours.mainShade,
          foregroundColor: _kid ? Colours.accentKid : Colours.accent,
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsetsGeometry.symmetric(horizontal: 36.0),
          iconColor: _kid ? Colours.accentKid : Colours.accent,
        ),
        expansionTileTheme: ExpansionTileThemeData(
          expandedAlignment: Alignment.center,
          childrenPadding: const EdgeInsetsGeometry.only(
            bottom: 36.0,
            left: 36.0,
            right: 36.0,
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            side: BorderSide.none,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            side: BorderSide.none,
          ),
          collapsedBackgroundColor: _kid ? Colours.mainKid : Colours.main,
          backgroundColor: _kid ? Colours.mainKid : Colours.main,
          collapsedIconColor: _kid ? Colours.accentKid : Colours.accent,
          iconColor: _kid ? Colours.accentKid : Colours.accent,
        ),
      ),
      home: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: const [
            PersonPage(),
            SkillsPage(),
            ExperiencePage(),
            ProjectsPage(),
          ],
        ),
        bottomNavigationBar: FloatyNavBar(
          margin: const EdgeInsets.only(bottom: 9.0),
          height: 50.0,
          selectedTab: _currentPage.index,
          backgroundColor: _kid ? Colours.mainShadeKid : Colours.mainShade,
          shape: const RectangleShape(radius: 12.0),
          tabs: [
            for (var page in CVPage.values)
              FloatyTab(
                isSelected: _currentPage == page,
                icon: Icon(page.icon),
                title: page.label,
                selectedColor: _kid ? Colours.accentKid : Colours.accent,
                unselectedColor: Colors.transparent,
                titleStyle: TextStyle(
                  fontFamily: Fonts.caps,
                  color: _kid ? Colours.accentShadeKid : Colours.accentShade,
                ),
                onTap: () {
                  _tabController.index = page.index;
                },
                floatyActionButton: FloatyActionButton(
                  heroTag: 'btnKid',
                  size: 45.0,
                  mini: true,
                  foregroundColor: _kid ? Colours.accentKid : Colours.accent,
                  icon: const Icon(Icons.theater_comedy, size: 30),
                  onTap: () => setState(() {
                    _kid = !_kid;
                  }),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
