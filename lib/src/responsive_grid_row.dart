import 'package:flutter/widgets.dart';

import 'utils.dart';

///
/// Creates a row of [rowItems.length] size with a width of [itemWidth] and
/// [spacing] in between them.
///
/// The default [MainAxisAlignment] of the returned row is [start]. It can be
/// modified through the [rowMainAxisAlignment] paramter.
///
class ResponsiveGridRow extends StatelessWidget {
  final List<Widget> rowItems;
  final double spacing;
  final double itemWidth;
  final MainAxisAlignment rowMainAxisAlignment;

  const ResponsiveGridRow({
    Key key,
    @required this.rowItems,
    @required this.spacing,
    @required this.itemWidth,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Wrap the items with a SizedBox of width [itemWidth]
    var sizedRowItems =
        rowItems.map((e) => SizedBox(width: itemWidth, child: e)).toList();

    // Join SizedBoxes in between the items with a fixed width of [spacing]
    var spacedRowItems =
        joinWithWidget(sizedRowItems, SizedBox(width: spacing));

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: spacedRowItems,
      ),
    );
  }
}
