import 'package:_portfolio/tools.dart';

Widget buildLevel(Leveling level) => Container(
  padding: EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 1),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: Colours.mainShade,
  ),
  child: Text(
    level.label,
    style: TextStyle(fontFamily: Fonts.caps, fontSize: 12, color: level.colour),
  ),
);

class GalleryView extends StatelessWidget {
  final Axis scrollAxis;
  final List<Widget> children;
  final double scrollDistance;
  final Duration scrollDuration;
  final Curve scrollCurve;

  final _scrollController = ScrollController();

  GalleryView({
    super.key,
    required this.scrollAxis,
    required this.children,
    required this.scrollDistance,
    required this.scrollDuration,
    required this.scrollCurve,
  });
  GalleryView.shots({super.key, required this.children})
    : scrollAxis = Axis.horizontal,
      scrollDistance = 381,
      scrollDuration = Durations.medium3,
      scrollCurve = Curves.easeOut;

  @override
  Widget build(BuildContext context) {
    final childrenScrollListView = [
      if (children.length >= 3)
        IconButton(
          onPressed: () {
            if (_scrollController.position.pixels >=
                _scrollController.position.minScrollExtent) {
              _scrollController.animateTo(
                _scrollController.position.pixels - scrollDistance,
                duration: scrollDuration,
                curve: scrollCurve,
              );
            }
          },
          icon: Icon(
            scrollAxis == Axis.horizontal
                ? Icons.arrow_left
                : Icons.arrow_drop_up,
          ),
        ),
      Expanded(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: children.length,
            itemBuilder: (context, index) {
              return children[index];
            },
          ),
        ),
      ),
      if (children.length >= 3)
        IconButton(
          onPressed: () {
            if (_scrollController.position.pixels <=
                _scrollController.position.maxScrollExtent) {
              _scrollController.animateTo(
                _scrollController.position.pixels + scrollDistance,
                duration: scrollDuration,
                curve: scrollCurve,
              );
            }
          },
          icon: Icon(
            scrollAxis == Axis.horizontal
                ? Icons.arrow_right
                : Icons.arrow_drop_down,
          ),
        ),
    ];
    return scrollAxis == Axis.horizontal
        ? Row(children: childrenScrollListView)
        : Column(children: childrenScrollListView);
  }
}
