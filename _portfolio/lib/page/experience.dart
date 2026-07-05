import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/cards.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(36.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 36,
            runSpacing: 36,
            children: [
              ExpCard.certificate(
                experience: 'Software Design',
                details:
                    'the DAAD programme "Digital Ukraine: Ensuring academic success in times of crisis"',
                author: 'Wildau-Kharkiv IT Bridge IV',
                description:
                    'Credit Points: 4 ECTS\nStudy program: 122 Computer science\nAchieved the grade 96%',
              ),
              ExpCard.certificate(
                experience: 'Fundamentals of cryptography',
                details:
                    'the DAAD programme "Digital Ukraine: Ensuring academic success in times of crisis"',
                author: 'Wildau-Kharkiv IT Bridge IV',
                description:
                    'Credit Points: 5 ECTS\nStudy program: 122 Computer science\nAchieved the grade 98%',
              ),
              ExpCard.certificate(
                experience: 'Statistical Data Analysis',
                details:
                    'the DAAD programme "Digital Ukraine: Ensuring academic success in times of crisis"',
                author: 'Wildau-Kharkiv IT Bridge III',
                description:
                    'Credit Points: 4 ECTS\nStudy program: 122 Computer science\nAchieved the grade 99%',
              ),
              ExpCard.certificate(
                experience: 'Creation and Development of IT Products',
                details: 'the internship online course',
                author: 'GENESIS',
                description: 'Course completion success rate: 100%',
              ),
              ExpCard.certificate(
                experience: 'IT SKILLS STANDARD CERTIFICATE',
                details:
                    'Validating algorithmic thinking and coding skills for the digital future!',
                author: 'NGO Kharkiv IT Cluster, Youth Science Society Q-Bit',
                description:
                    'Certification Exam: L0 (Beginner)\nProgramming Language: C++\nPerformance: 100,00%\nGrade: Outstanding',
              ),
              ExpCard.event(
                experience: 'MillieJam1',
                details: 'Millie Treasure',
                author: 'Gentlegoose',
                achievements: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              ExpCard.event(
                experience: 'Ctrl+Alt+Disinfo',
                details: '"Domino Circo vel Circo Domino"',
                author: 'Gentlegoose',
                achievements: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              ExpCard.event(
                experience: 'Snappy Gurus Game Off',
                details: '"After All, that World is not so Green"',
                author: 'Gentlegoose',
                achievements: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              ExpCard.event(
                experience: 'Global Game Jam 2024',
                details: '"Exit Exists?"',
                author: 'Gentlegoose',
                achievements: [
                  'Developed 2D game using GodotEngine;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
              ExpCard.event(
                experience: 'Global Game Jam 2023',
                details: '"ROOTS"',
                author: 'Gentlegoose',
                achievements: [
                  'Designed 2D game using Krita;',
                  'Made music for the project using FL Studio;',
                  'Worked with the team.',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
