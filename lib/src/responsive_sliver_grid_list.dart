import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [SliverList] with a [SliverChildBuilderDelegate]
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  ResponsiveSliverGridList({
    @required List<Widget> children,
    @required double minItemWidth,
    double spacing = 16,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
  }) : super(minItemWidth, spacing, children, rowMainAxisAlignment);

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
