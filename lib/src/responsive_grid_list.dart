import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [ListView.builder()]
///
class ResponsiveGridList extends AbstractResponsiveGridList {
  ResponsiveGridList({
    required List<Widget> children,
    required double minItemWidth,
    double spacing = 16,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
  }) : super(minItemWidth, spacing, children, rowMainAxisAlignment);

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
