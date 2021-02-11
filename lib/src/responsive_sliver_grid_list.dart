import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// A [SliverList] containing [children] with [spacing] in between.
///
/// [minItemWidth] is the minimum item width that is returned in the list.
/// The width can be less than this if there is not enough space in the Layout.
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  const ResponsiveSliverGridList({
    @required List<Widget> children,
    @required double minItemWidth,
    double spacing = 16,
  }) : super(minItemWidth, spacing, children);

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        // Get the grid list items
        var items = getResponsiveGridListItems(constraints.crossAxisExtent);

        // Return the SliverList with a SliverChildBuilderDelegate
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return items[index];
            },
            childCount: items.length,
          ),
        );
      },
    );
  }
}
