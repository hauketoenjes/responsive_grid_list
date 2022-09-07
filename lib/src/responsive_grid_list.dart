import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [ListView.builder()]
///
class ResponsiveGridList extends AbstractResponsiveGridList {
  /// Constructor of [ResponsiveGridList].
  const ResponsiveGridList({
    super.key,
    required super.minItemWidth,
    super.minItemsPerRow = 1,
    super.maxItemsPerRow,
    super.horizontalGridSpacing = 16,
    super.verticalGridSpacing = 16,
    super.horizontalGridMargin,
    super.verticalGridMargin,
    super.rowMainAxisAlignment = MainAxisAlignment.start,
    this.shrinkWrap = false,
    required super.children,
    // coverage:ignore-start
  });

  /// shrinkWrap property of [ListView.builder].
  final bool shrinkWrap; // coverage:ignore-end

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.maxWidth);

        return ListView.builder(
          itemCount: items.length,
          shrinkWrap: shrinkWrap,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
        );
      },
    );
  }
}
