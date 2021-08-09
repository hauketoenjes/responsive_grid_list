import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [ListView.builder()]
///
class ResponsiveGridList extends AbstractResponsiveGridList {
  const ResponsiveGridList({
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.maxWidth);

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
