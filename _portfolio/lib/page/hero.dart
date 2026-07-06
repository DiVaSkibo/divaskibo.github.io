import 'package:_portfolio/tools.dart';

class HeroPage extends StatelessWidget {
  final Object tag;
  final Widget child;

  const HeroPage({super.key, required this.tag, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Hero(tag: tag, child: child),
        ),
      ),
    );
  }
}
