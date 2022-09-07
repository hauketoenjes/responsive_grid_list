import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/abstract_responsive_grid_list.dart';

///
/// An [AbstractResponsiveGridList] returning the grid items as list of
/// [Widget]s in a builder function. This allows for use in any kind of
/// List or Column.
///
class ResponsiveGridListBuilder extends AbstractResponsiveGridList {
  /// Constructor of [ResponsiveGridListBuilder].
  const ResponsiveGridListBuilder({
    super.key,
    required super.minItemWidth,
    super.minItemsPerRow = 1,
    super.maxItemsPerRow,
    super.horizontalGridSpacing = 16,
    super.verticalGridSpacing = 16,
    super.horizontalGridMargin,
    super.verticalGridMargin,
    super.rowMainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> gridItems,
    required this.builder,
  }) : super(
          children: gridItems,
        );

  ///  Builder Function to use the returned `items` in any kind of list.
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
  final Widget Function(BuildContext context, List<Widget> items) builder;

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
