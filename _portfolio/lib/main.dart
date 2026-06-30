import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/rooter.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: Fonts.basic,
        scaffoldBackgroundColor: Colours.mainShade,
        textTheme: const TextTheme(bodyMedium: Styles.basic),
        dividerTheme: const DividerThemeData(thickness: 2, color: Colours.main),
      ),
      initialRoute: '/kid',
      routes: {
        '/kid': (context) => const Rooter(),
        '/retiree': (context) => const Rooter(),
      },
    );
  }
}
