import 'package:_portfolio/page/hero.dart';
import 'package:_portfolio/tools.dart';

Widget buildLevel(Leveling level) => Container(
  padding: const EdgeInsetsGeometry.symmetric(horizontal: 10, vertical: 1),
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(18.0)),
    color: Colours.mainShade,
  ),
  child: Text(
    level.label,
    style: TextStyle(fontFamily: Fonts.caps, fontSize: 12, color: level.colour),
  ),
);

class GalleryView extends StatelessWidget {
  final Axis axis;
  final double force;
  final List<String> images;

  final _scrollController = ScrollController();

  GalleryView({
    super.key,
    this.axis = Axis.horizontal,
    required this.force,
    required this.images,
  });

  Widget _buildBase(List<Widget> children) => switch (axis) {
    Axis.horizontal => Row(children: children),
    Axis.vertical => Column(children: children),
  };
  Widget _buildScrollButton(AxisDirection direction) => IconButton(
    icon: Icon(switch (direction) {
      AxisDirection.up => Icons.arrow_drop_up,
      AxisDirection.down => Icons.arrow_drop_down,
      AxisDirection.left => Icons.arrow_left,
      AxisDirection.right => Icons.arrow_right,
    }),
    onPressed: () {
      if (_scrollController.position.pixels >=
          _scrollController.position.minScrollExtent) {
        _scrollController.animateTo(
          _scrollController.position.pixels +
              switch (direction) {
                AxisDirection.up || AxisDirection.left => -force,
                AxisDirection.down || AxisDirection.right => force,
              },
          duration: Durations.medium3,
          curve: Curves.easeOut,
        );
      }
    },
  );
  Widget _buildImage(BuildContext context, String image) => InkWell(
    onTap: () => Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => HeroPage(
          tag: image.substring(20),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(18.0)),
            child: Image.asset(image),
          ),
        ),
      ),
    ),
    child: Hero(
      tag: image.substring(20),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(9.0)),
        child: Image.asset(image),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return _buildBase([
      _buildScrollButton(switch (axis) {
        Axis.vertical => AxisDirection.up,
        Axis.horizontal => AxisDirection.left,
      }),
      Expanded(
        child: ListView(
          scrollDirection: axis,
          controller: _scrollController,
          addAutomaticKeepAlives: false,
          physics: const BouncingScrollPhysics(),
          children: [for (final image in images) _buildImage(context, image)],
        ),
      ),
      _buildScrollButton(switch (axis) {
        Axis.vertical => AxisDirection.down,
        Axis.horizontal => AxisDirection.right,
      }),
    ]);
  }
}
