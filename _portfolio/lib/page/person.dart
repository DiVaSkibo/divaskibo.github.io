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
                    'BSc in Computer Science\nNational Aerospace University "Kharkiv Aviation Institute"\nFaculty of Intelligent Control Systems\nDepartment of Mathematical Modelling and Artificial Intelligence\n\t•\tGraduated with a high GPA; consistently ranked at the top of the student list and awarded an increased merit scholarship;\n\t•\tSuccessfully defended Bachelor\'s thesis with an "Excellent" grade. ',
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
                about:
                    'BSc in Computer Science\nNational Aerospace University "Kharkiv Aviation Institute"\n\t•\tSuccessfully defended a 3rd-year term project titled "Software Design of a Game using Godot Engine", earning an "Excellent" grade;\n\t•\t4+ years of practical experience in game development;\n\t•\tPossess hands-on experience across the full development pipeline, including programming (Godot), game design (Miro), audio production (FL Studio), and 2D art (Krita).',
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
