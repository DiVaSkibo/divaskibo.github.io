import 'package:url_launcher/url_launcher.dart';
import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/basics.dart';

class PersonCard extends StatefulWidget {
  final String title;
  final String body;
  final String image;
  final String? info;
  final Map<String, String>? links;

  const PersonCard({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    this.info,
    this.links,
  });

  @override
  State<PersonCard> createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  @override
  Widget build(BuildContext context) {
    final String? info = widget.info;
    final links = widget.links;
    final List<Map> uris = [];
    if (links != null) {
      for (final String key in links.keys) {
        uris.add({'text': key, 'link': Uri.parse(links[key]!)});
      }
    }
    return SingleChildScrollView(
      child: buildCard(
        width: 1000.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 36,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 18,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    widget.image,
                    width: MediaQuery.of(context).size.width / 6,
                  ),
                ),
                if (info != null) Text(info, textAlign: TextAlign.left),
                if (uris.isNotEmpty)
                  Column(
                    children: List.generate(
                      uris.length,
                      (index) => InkWell(
                        child: Text(uris[index]['text'], style: Styles.note),
                        onTap: () => launchUrl(uris[index]['link']),
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Styles.header,
                    textAlign: TextAlign.left,
                  ),
                  const Divider(),
                  Text(widget.body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsCard extends StatelessWidget {
  final String title;
  final Map<String, Level?> skills;

  const SkillsCard({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return buildCard(
      width: 369.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Styles.header),
          const Divider(color: Colours.main),
          Column(
            spacing: 9,
            children: [
              for (final skill in skills.entries)
                Row(
                  children: [
                    Text(skill.key),
                    const Spacer(),
                    if (skill.value != null) buildLevel(skill.value!),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatefulWidget {
  final String event;
  final String role;
  final List<String> experiences;

  const EventCard({
    super.key,
    required this.event,
    required this.role,
    required this.experiences,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = List.generate(
      widget.experiences.length,
      (index) => Marker.circle(child: Text(widget.experiences[index])),
    );
    return Container(
      padding: EdgeInsetsGeometry.all(36),
      width: 527,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Marker.event(child: Text(widget.event, style: Styles.header)),
          const Divider(color: Colours.mainShade),
          Row(
            children: [
              SizedBox(width: 18),
              Text(widget.role, style: Styles.note),
            ],
          ),
          SizedBox(height: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 9,
            children: markers,
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String body;
  final String image;
  final List<String>? screenshots;
  final Map<String, String>? links;

  const ProjectCard({
    super.key,
    required this.title,
    required this.body,
    required this.image,
    this.screenshots,
    this.links,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    final List<String>? screenshotsAssets = widget.screenshots;
    final List<ClipRRect> screenshots = screenshotsAssets == null
        ? []
        : List.generate(
            screenshotsAssets.length,
            (index) => ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(screenshotsAssets[index], width: 181),
            ),
          );
    final links = widget.links;
    final List<Map> uris = [];
    if (links != null) {
      for (final String key in links.keys) {
        uris.add({'text': key, 'link': Uri.parse(links[key]!)});
      }
    }
    return SingleChildScrollView(
      child: buildCard(
        width: 1000.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 18,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 36,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(widget.image, height: 200),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: Styles.header),
                      if (screenshots.isNotEmpty)
                        GalleryView.shots(children: screenshots),
                      //if (links != null) Text(links, style: Styles.note),
                      if (uris.isNotEmpty)
                        Row(
                          spacing: 30,
                          children: List.generate(
                            uris.length,
                            (index) => InkWell(
                              child: Text(
                                uris[index]['text'],
                                style: Styles.note,
                              ),
                              onTap: () => launchUrl(uris[index]['link']),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Text(widget.body, style: Styles.description),
          ],
        ),
      ),
    );
  }
}
