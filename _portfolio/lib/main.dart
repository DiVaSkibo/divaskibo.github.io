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
        scaffoldBackgroundColor: Colours.mainShade,
        brightness: Brightness.dark,
        textTheme: TextTheme(bodyMedium: Styles.basic),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: Styles.buttonText,
          ),
        ),
      ),
      initialRoute: '/kid',
      routes: {
        '/kid': (context) => const Rooter(),
        '/retiree': (context) => const Rooter(),
      },
    );
  }
}
