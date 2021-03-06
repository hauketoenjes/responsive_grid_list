import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [SliverList] with a [SliverChildBuilderDelegate]
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  ResponsiveSliverGridList({
    required double minItemWidth,
    double horizontalGridSpacing = 16,
    double verticalGridSpacing = 16,
    double? horizontalGridMargin,
    double? verticalGridMargin,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> children,
  }) : super(
          minItemWidth: minItemWidth,
          horizontalGridSpacing: horizontalGridSpacing,
          verticalGridSpacing: verticalGridSpacing,
          horizontalGridMargin: horizontalGridMargin,
          verticalGridMargin: verticalGridMargin,
          rowMainAxisAlignment: rowMainAxisAlignment,
          children: children,
        );

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
