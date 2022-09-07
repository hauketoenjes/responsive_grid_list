import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [SliverList] with a [SliverChildBuilderDelegate]
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  /// Constructor of [ResponsiveSliverGridList].
  const ResponsiveSliverGridList({
    super.key,
    required super.minItemWidth,
    super.minItemsPerRow = 1,
    super.maxItemsPerRow,
    super.horizontalGridSpacing = 16,
    super.verticalGridSpacing = 16,
    super.horizontalGridMargin,
    super.verticalGridMargin,
    super.rowMainAxisAlignment = MainAxisAlignment.start,
    required super.children,
    // coverage:ignore-start
  }); // coverage:ignore-end

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
