import 'dart:math';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:_portfolio/tools.dart';
import 'package:_portfolio/widget/basics.dart';

/// #### person card widget
/// CV person information viewer
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
      ? TextButton(
          onPressed: () {},
          child: SelectableText(info!, textAlign: TextAlign.end),
        )
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
                      icon: Icon(link.key.icon, color: link.key.colour),
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
                      icon: Icon(link.key.icon, color: link.key.colour),
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
        width: min<double>(1000.0, MediaQuery.of(context).size.width - 72.0),
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

/// #### skills card widget
/// CV person skills viewer
class SkillsCard extends StatelessWidget {
  final String title;
  final Map<String, Leveling?> skills;

  const SkillsCard({super.key, required this.title, required this.skills});

  List<Widget> _buildSkills() => skills.entries
      .map(
        (skill) => Row(
          children: [
            SelectableText(skill.key),
            const Spacer(),
            if (skill.value != null) buildLevel(skill.value!),
          ],
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 369.0,
      child: ExpansionTile(
        initiallyExpanded: true,
        maintainState: true,
        showTrailingIcon: false,
        title: SelectableText(title, style: Styles.header),
        children: [
          const Divider(),
          Column(spacing: 6, children: _buildSkills()),
        ],
      ),
    );
  }
}

/// #### experience card widget
/// CV person experience viewer
class ExpCard extends StatelessWidget {
  final String experience;
  final IconData icon;
  final String? details;
  final String? author;
  final String? description;
  final List<String>? achievements;

  const ExpCard({
    super.key,
    required this.experience,
    required this.icon,
    this.details,
    this.author,
    this.description,
    this.achievements,
  });

  const ExpCard.certificate({
    super.key,
    required this.experience,
    this.details,
    this.author,
    this.description,
  }) : icon = Icons.workspace_premium,
       achievements = null;
  const ExpCard.event({
    super.key,
    required this.experience,
    this.details,
    this.author,
    this.description,
    this.achievements,
  }) : icon = Icons.emoji_events;

  Widget _buildExperience() => SelectableText(experience, style: Styles.header);
  Widget? _buildDetails() => details != null
      ? TextButton(onPressed: () {}, child: SelectableText(details!))
      : null;
  Widget? _buildDescription() =>
      description != null ? SelectableText(description!) : null;
  List<Widget>? _buildAchievements() => achievements
      ?.map(
        (achieve) => ListTile(
          minTileHeight: 0.0,
          minVerticalPadding: 0.0,
          horizontalTitleGap: 18.0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          leading: const Icon(Icons.gesture),
          subtitle: SelectableText(achieve),
        ),
      )
      .toList();
  Widget? _buildAuthor() => author != null
      ? TextButton(onPressed: () {}, child: SelectableText(author!))
      : null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 606.0,
      child: ExpansionTile(
        initiallyExpanded: false,
        maintainState: false,
        showTrailingIcon: false,
        expandedCrossAxisAlignment: CrossAxisAlignment.center,
        leading: Icon(icon, size: 36),
        title: _buildExperience(),
        subtitle: _buildDetails(),
        children: [
          const Divider(),
          Column(
            spacing: 6,
            children: [
              ?_buildDescription(),
              ...?_buildAchievements(),
              ?_buildAuthor(),
            ],
          ),
        ],
      ),
    );
  }
}

/// #### project card widget
/// CV person project viewer
class ProjectCard extends StatelessWidget {
  final String name;
  final String logo;
  final String description;
  final List<String>? screenshots;
  final Map<Linktype, String>? links;

  const ProjectCard({
    super.key,
    required this.name,
    required this.logo,
    required this.description,
    this.screenshots,
    this.links,
  });

  Widget _buildName() => SelectableText(name, style: Styles.header);
  Widget _buildLogo() => ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(9.0)),
    child: Image.asset(logo),
  );
  Widget _buildDescription() =>
      SelectableText(description, style: Styles.description);
  Widget? _buildScreenshots() => screenshots != null && screenshots!.isNotEmpty
      ? SizedBox(
          height: 300.0,
          child: GalleryView(
            axis: Axis.vertical,
            force: 200.0,
            images: screenshots!,
          ),
        )
      : null;
  Widget? _buildLinks() => links != null
      ? Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.end,
          runAlignment: WrapAlignment.end,
          children: [
            for (final link in links!.entries.where(
              (entry) => entry.value.contains('https://'),
            ))
              IconButton(
                icon: Icon(link.key.icon, color: link.key.colour),
                onPressed: () => launchUrl(Uri.parse(link.value)),
              ),
          ],
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: min<double>(1000.0, MediaQuery.of(context).size.width - 72.0),
      child: ExpansionTile(
        initiallyExpanded: false,
        maintainState: false,
        showTrailingIcon: false,
        title: const SizedBox.shrink(),
        subtitle: Row(
          spacing: 36,
          children: [
            Expanded(flex: 13, child: _buildLogo()),
            Expanded(flex: 36, child: _buildName()),
          ],
        ),
        children: [
          const Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 18,
            children: [
              if (screenshots != null && screenshots!.isNotEmpty ||
                  links != null && links!.isNotEmpty)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [?_buildLinks(), ?_buildScreenshots()],
                  ),
                ),
              Expanded(flex: 3, child: _buildDescription()),
            ],
          ),
        ],
      ),
    );
  }
}
