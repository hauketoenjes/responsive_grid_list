import 'package:flutter/widgets.dart';

import 'abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid items as list of [Widget]s
/// in a builder function. This allows for use in any kind of List or Column.
///
class ResponsiveGridListBuilder extends AbstractResponsiveGridList {
  ///
  ///  Builder Function to use [items] in any kind of list.
  ///
  /// e.g:
  ///
  /// ```dart
  /// ResponsiveGridListBuilder(
  ///   minItemWidth: 200,
  ///   gridItems: [Text('Test')],
  ///   builder: (context, items){
  ///     return ListView(
  ///       children: items,
  ///     );
  ///   },
  /// )
  /// ```
  ///
  final Widget Function(BuildContext context, List<Widget> items) builder;

  const ResponsiveGridListBuilder({
    required double minItemWidth,
    int minItemsPerRow = 1,
    int? maxItemsPerRow,
    double horizontalGridSpacing = 16,
    double verticalGridSpacing = 16,
    double? horizontalGridMargin,
    double? verticalGridMargin,
    MainAxisAlignment rowMainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> gridItems,
    required this.builder,
  }) : super(
          minItemWidth: minItemWidth,
          minItemsPerRow: minItemsPerRow,
          maxItemsPerRow: maxItemsPerRow,
          horizontalGridSpacing: horizontalGridSpacing,
          verticalGridSpacing: verticalGridSpacing,
          horizontalGridMargin: horizontalGridMargin,
          verticalGridMargin: verticalGridMargin,
          rowMainAxisAlignment: rowMainAxisAlignment,
          children: gridItems,
        );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.maxWidth);

        return builder(context, items);
      },
    );
  }
}
