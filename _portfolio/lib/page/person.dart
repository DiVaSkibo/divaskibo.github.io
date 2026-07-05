import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/cards.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36.0),
          child: Column(
            spacing: 36,
            children: [
              PersonCard(
                name: 'Dmytro SKIBO',
                avatar: 'assets/image/avatar/Me.jpg',
                about:
                    'Learn Computer Science in National Aerospace University - Kharkiv Aviation Institute. Faculty of Intelligent Control Systems. Department of Mathematical Modelling and Artificial Intelligence. I receive an increased scholarship for my high GPA in the student rankings.',
                info: '16.12.2004\nKharkiv, Ukraine',
                links: {
                  Linktype.email: 'pipaski0264@gmail.com',
                  Linktype.telegram: 'https://t.me/Zlo_Ol2',
                  Linktype.linkedin:
                      'https://www.linkedin.com/in/dmytro-skibo-61a2233ba/',
                  Linktype.github: 'https://github.com/DiVaSkibo',
                  Linktype.itch: 'https://em-o-ja.itch.io/',
                },
              ),
              PersonCard(
                name: 'Oie gentil',
                avatar: 'assets/image/avatar/My.jpg',
                about: 'Member of the Gentlegoose team.',
                links: {
                  Linktype.discord: '.empireofjapan',
                  Linktype.music: 'https://music.youtube.com/@zlo_ol2',
                  Linktype.cosmos: 'https://www.cosmos.so/oiegentil',
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
