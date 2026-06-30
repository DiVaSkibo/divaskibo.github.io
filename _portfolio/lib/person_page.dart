import 'package:_portfolio/__tools.dart';
import 'package:_portfolio/_person_card.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36),
          child: Column(
            spacing: 36,
            children: [
              PersonCard(
                title: 'Dmytro SKIBO',
                body:
                    'Learn Computer Science in National Aerospace University - Kharkiv Aviation Institute. Faculty of Intelligent Control Systems. Department of Mathematical Modelling and Artificial Intelligence. I receive an increased scholarship for my high GPA in the student rankings.',
                image: 'assets/image/avatar/Me.jpg',
                info: '16.12.2004\nKharkiv, Ukraine',
                links: {
                  '+380 66 727 4718': '+380 66 727 4718',
                  'pipaski0264@gmail.com': 'pipaski0264@gmail.com',
                  'https://t.me/Zlo_Ol2': 'https://t.me/Zlo_Ol2',
                },
              ),
              PersonCard(
                title: 'Oie gentil',
                body: 'assets/image/avatar/My.jpg',
                image: 'assets/image/avatar/My.jpg',
                links: {
                  'link':
                      'https://www.youtube.com/@dunkelbahn7022\nhttps://www.youtube.com/@zlo_ol2',
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
