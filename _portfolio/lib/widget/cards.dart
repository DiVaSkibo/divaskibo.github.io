import 'dart:math';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/basics.dart';

class PersonCard extends StatelessWidget {
  final String name;
  final String avatar;
  final String about;
  final String? info;
  final Map<Linktype, String>? links;

  const PersonCard({
    super.key,
    required this.name,
    required this.avatar,
    required this.about,
    this.info,
    this.links,
  });

  Widget _buildName() => SelectableText(name, style: Styles.header);
  Widget _buildAvatar() => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(9.0)),
    child: Image.asset(avatar),
  );
  Widget _buildAbout() => SelectableText(about);
  Widget? _buildInfo() => info != null
      ? SelectableText(info!, style: Styles.note, textAlign: TextAlign.end)
      : null;
  Widget? _buildLinks() => links != null
      ? Column(
          verticalDirection: VerticalDirection.up,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (links != null &&
                links!.entries
                    .where((entry) => !entry.value.contains('https://'))
                    .isNotEmpty)
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.end,
                runAlignment: WrapAlignment.end,
                children: [
                  for (final link in links!.entries.where(
                    (entry) => !entry.value.contains('https://'),
                  ))
                    IconButton(
                      icon: Icon(link.key.icon),
                      onPressed: () =>
                          Clipboard.setData(ClipboardData(text: link.value)),
                    ),
                ],
              ),
            if (links != null &&
                links!.entries
                    .where((entry) => entry.value.contains('https://'))
                    .isNotEmpty)
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.end,
                runAlignment: WrapAlignment.end,
                children: [
                  for (final link in links!.entries.where(
                    (entry) => entry.value.contains('https://'),
                  ))
                    IconButton(
                      icon: Icon(link.key.icon),
                      onPressed: () => launchUrl(Uri.parse(link.value)),
                    ),
                ],
              ),
          ],
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: min<double>(MediaQuery.of(context).size.width - 72.0, 1000.0),
        child: ExpansionTile(
          initiallyExpanded: true,
          maintainState: false,
          showTrailingIcon: false,
          title: const SizedBox.shrink(),
          subtitle: Row(
            spacing: 36,
            children: [
              Expanded(flex: 1, child: _buildAvatar()),
              Expanded(flex: 3, child: _buildName()),
            ],
          ),
          children: [
            const Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 36,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 21,
                    children: [?_buildInfo(), ?_buildLinks()],
                  ),
                ),
                Expanded(flex: 3, child: _buildAbout()),
              ],
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
    return SizedBox(
      width: 369.0,
      child: ExpansionTile(
        initiallyExpanded: true,
        maintainState: true,
        showTrailingIcon: false,
        title: Text(title, style: Styles.header),
        children: [
          const Divider(),
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

class ExpCard extends StatelessWidget {
  final String event;
  final String role;
  final List<String> experiences;

  const ExpCard({
    super.key,
    required this.event,
    required this.role,
    required this.experiences,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.all(36),
      width: 527,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Marker.event(child: Text(event, style: Styles.header)),
          const Divider(),
          Row(
            children: [
              SizedBox(width: 18),
              Text(role, style: Styles.note),
            ],
          ),
          SizedBox(height: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 9,
            children: [
              for (final exp in experiences) Marker.circle(child: Text(exp)),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final List<Map> uris = [];
    if (links != null) {
      for (final String key in links!.keys) {
        uris.add({'text': key, 'link': Uri.parse(links![key]!)});
      }
    }
    return SingleChildScrollView(
      child: SizedBox(
        width: 1000.0,
        child: ExpansionTile(
          initiallyExpanded: false,
          maintainState: false,
          showTrailingIcon: false,
          title: const SizedBox.shrink(),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 36,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(9.0)),
                child: Image.asset(image, height: 200.0),
              ),
              SizedBox(width: 333.0, child: Text(title, style: Styles.header)),
            ],
          ),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 36,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (screenshots != null && screenshots!.isNotEmpty)
                        GalleryView.shots(
                          children: screenshots!
                              .map(
                                (screenshot) => ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(9.0),
                                  ),
                                  child: Image.asset(screenshot, width: 181.0),
                                ),
                              )
                              .toList(),
                        ),
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
            const Divider(),
            Text(body, style: Styles.description),
          ],
        ),
      ),
    );
  }
}
