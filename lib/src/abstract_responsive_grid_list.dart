import 'package:flutter/widgets.dart';
import 'package:quiver/iterables.dart';
import 'package:responsive_grid_list/src/extensions/list_extensions.dart';
import 'package:responsive_grid_list/src/responsive_grid_row.dart';

///
/// Abstract class providing the method [getResponsiveGridListItems] to
/// calculate the most fitting items in row with [horizontalGridSpacing],
/// [verticalGridSpacing] and [minItemWidth].
///
/// The maximum number of items per row can be constrained with
/// [maxItemsPerRow].
///
abstract class AbstractResponsiveGridList extends StatelessWidget {
  /// Constructor of [AbstractResponsiveGridList].
  const AbstractResponsiveGridList({
    required this.minItemWidth,
    required this.minItemsPerRow,
    required this.horizontalGridSpacing,
    required this.verticalGridSpacing,
    required this.rowMainAxisAlignment,
    required this.children,
    this.maxItemsPerRow,
    this.horizontalGridMargin,
    this.verticalGridMargin,
    super.key,
  })  : assert(
          // coverage:ignore-start
          minItemWidth > 0,
          'minItemWidth has to be > 0. It instead was set to $minItemWidth',
        ),
        assert(
          minItemsPerRow > 0,
          'minItemsPerRow has to be > 0. It instead was set to $minItemsPerRow',
        ),
        assert(
          maxItemsPerRow == null || maxItemsPerRow >= minItemsPerRow,
          'maxItemsPerRow can only be null or >= minItemsPerRow '
          '($minItemsPerRow). It instead was set to $maxItemsPerRow',
        );

  ///
  /// Children of the resulting grid list.
  ///
  final List<Widget> children;

  ///
  /// The minimum item width of each individual item in the list. Can be smaller
  /// if the viewport constraints are smaller.
  ///
  final double minItemWidth;

  ///
  /// Minimum items to show per row. If this is set to a value higher than 1,
  /// this takes precedence over [minItemWidth] and allows items to be smaller
  /// than [minItemWidth] to fit at least [minItemsPerRow] items.
  ///
  final int minItemsPerRow;

  ///
  /// Maximum items to show per row. By default the package shows all items that
  /// fit into the available space according to [minItemWidth].
  ///
  /// Note that this should only be used when limiting items on large screens
  /// since it will stretch [maxItemsPerRow] items across the whole width
  /// when maximum is reached. This can result in a large difference to
  /// [minItemWidth].
  ///
  final int? maxItemsPerRow;

  ///
  /// The horizontal spacing between the items in the grid.
  ///
  final double horizontalGridSpacing;

  ///
  /// The vertical spacing between the items in the grid.
  ///
  final double verticalGridSpacing;

  ///
  /// The horizontal spacing around the grid.
  ///
  final double? horizontalGridMargin;

  ///
  /// The vertical spacing around the grid.
  ///
  final double? verticalGridMargin;

  ///
  /// [MainAxisAlignment] of each row in the grid list.
  ///
  final MainAxisAlignment rowMainAxisAlignment; // coverage:ignore-end

  ///
  /// Method to generate a list of [ResponsiveGridRow]'s with spacing in between
  /// them.
  ///
  /// [maxWidth] is the maximum width of the current layout.
  ///
  List<Widget> getResponsiveGridListItems(double maxWidth) {
    // Start with the minimum allowed number of items per row.
    var itemsPerRow = minItemsPerRow;

    // Calculate the current width according to the items per row
    var currentWidth =
        itemsPerRow * minItemWidth + (itemsPerRow - 1) * horizontalGridSpacing;

    // Add outer margin (vertical) if set
    if (horizontalGridMargin != null) {
      currentWidth += 2 * horizontalGridMargin!;
    }

    // While another pair of spacing + minItemWidth fits the row, add it to
    // the variables. Only add items while maxItemsPerRow is not reached.
    while (currentWidth < maxWidth &&
        (maxItemsPerRow == null || itemsPerRow < maxItemsPerRow!)) {
      if (currentWidth + (minItemWidth + horizontalGridSpacing) <= maxWidth) {
        // If another spacing + item fits in the row, add one item to the row
        // and update the currentWidth
        currentWidth += minItemWidth + horizontalGridSpacing;
        itemsPerRow++;
      } else {
        // If no other item + spacer fits into the row, break
        break;
      }
    }

    // Calculate the spacers per row (they are only in between the items, not
    // at the edges)
    final spacePerRow = itemsPerRow - 1;

    // Calculate the itemWidth that results from the maxWidth and number of
    // spacers and outer margin (horizontal)
    final itemWidth = (maxWidth -
            (spacePerRow * horizontalGridSpacing) -
            (2 * (horizontalGridMargin ?? 0))) /
        itemsPerRow;

    // Partition the items into groups of itemsPerRow length and map them
    // to ResponsiveGridRow's
    final items = partition(children, itemsPerRow)
        .map<Widget>(
          (e) => ResponsiveGridRow(
            rowItems: e,
            spacing: horizontalGridSpacing,
            horizontalGridMargin: horizontalGridMargin,
            itemWidth: itemWidth,
          ),
        )
        .toList();

    // Join the rows width spacing in between them (vertical)
    final responsiveGridListItems =
        items.genericJoin(SizedBox(height: verticalGridSpacing));

    // Add outer margin (vertical) if set
    if (verticalGridMargin != null) {
      return [
        SizedBox(height: verticalGridMargin),
        ...responsiveGridListItems,
        SizedBox(height: verticalGridMargin),
      ];
    }

    return responsiveGridListItems;
  }
}
