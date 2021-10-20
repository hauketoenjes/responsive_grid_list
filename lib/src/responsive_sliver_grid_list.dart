import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [SliverList] with a [SliverChildBuilderDelegate]
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  const ResponsiveSliverGridList({
    required double minItemWidth,
    int? maxItemsPerRow,
    double horizontalGridSpacing = 16,
    double verticalGridSpacing = 16,
    double? horizontalGridMargin,
    double? verticalGridMargin,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> children,
  }) : super(
          minItemWidth: minItemWidth,
          maxItemsPerRow: maxItemsPerRow,
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
        final items = getResponsiveGridListItems(constraints.crossAxisExtent);

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
