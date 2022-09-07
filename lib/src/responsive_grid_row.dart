import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/extensions/list_extensions.dart';

///
/// Creates a row of [rowItems] length size with a width of [itemWidth] and
/// [spacing] in between them.
///
/// The default [MainAxisAlignment] of the returned row is
/// [MainAxisAlignment.start]. It can be modified through the
/// [rowMainAxisAlignment] parameter.
///
class ResponsiveGridRow extends StatelessWidget {
  /// Constructs a new [ResponsiveGridRow].
  const ResponsiveGridRow({
    super.key,
    required this.rowItems,
    required this.spacing,
    this.horizontalGridMargin,
    required this.itemWidth,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
  });

  ///
  /// The items in the row.
  ///
  final List<Widget> rowItems;

  ///
  /// The spacing between the items in the row.
  ///
  final double spacing;

  ///
  /// The width of the items in the row.
  ///
  final double itemWidth;

  /// horizontal Margin around the grid.
  final double? horizontalGridMargin;

  ///
  /// The MainAxisAlignment of the row.
  ///
  /// Default's to [MainAxisAlignment.start].
  ///
  final MainAxisAlignment rowMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    // Wrap the items with a SizedBox of width [itemWidth]
    final sizedRowItems =
        rowItems.map((e) => SizedBox(width: itemWidth, child: e)).toList();

    // Join SizedBoxes in between the items with a fixed width of [spacing]
    var spacedRowItems = sizedRowItems.genericJoin(SizedBox(width: spacing));

    // Add outer margin, if not null
    if (horizontalGridMargin != null) {
      spacedRowItems = [
        SizedBox(width: horizontalGridMargin),
        ...spacedRowItems,
        SizedBox(width: horizontalGridMargin)
      ];
    }

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: rowMainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: spacedRowItems,
      ),
    );
  }
}
