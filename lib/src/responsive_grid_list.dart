import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// A [ListView] containing [children] with [spacing] in between.
///
/// [minItemWidth] is the minimum item width that is returned in the list.
/// The width can be less than this if there is not enough space in the Layout.
///
class ResponsiveGridList extends AbstractResponsiveGridList {
  ResponsiveGridList({
    @required List<Widget> children,
    @required double minItemWidth,
    double spacing = 16,
  }) : super(minItemWidth, spacing, children);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        var items = getResponsiveGridListItems(constraints.maxWidth);

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
        );
      },
    );
  }
}
