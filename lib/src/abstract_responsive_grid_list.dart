import 'package:flutter/widgets.dart';
import 'package:quiver/iterables.dart';

import 'responsive_grid_row.dart';
import 'utils.dart';

///
/// Abstract class providing the method [getResponsiveGridListItems] to calculate
/// the most fitting items in row with [spacing] and [minItemWidth]
///
abstract class AbstractResponsiveGridList extends StatelessWidget {
  final List<Widget> children;
  final double minItemWidth;
  final double spacing;

  const AbstractResponsiveGridList(
    this.minItemWidth,
    this.spacing,
    this.children, {
    Key key,
  }) : super(key: key);

  ///
  /// The max width of the current layout constraints
  ///
  List<Widget> getResponsiveGridListItems(double maxWidth) {
    // Set the currentWidth to minItemWidth and itemsPerRow to one
    // since this is the minimum that is needed per row.
    var currentWidth = minItemWidth;
    var itemsPerRow = 1;

    // While another pair of spacing + minItemWidth fits the row, add it to
    // the variables.
    while (currentWidth < maxWidth) {
      if (currentWidth + (minItemWidth + spacing) <= maxWidth) {
        // If another spacing + item fits in the row, add one item to the row
        // and update the currentWidth
        currentWidth += (minItemWidth + spacing);
        itemsPerRow++;
      } else {
        // If no other item + spacer fits into the row, break
        break;
      }
    }

    // Calculate the spacers per row (they are only in between the items, not
    // at the edges)
    var spacePerRow = itemsPerRow - 1;

    // Calculate the itemWidth that results from the maxWidth and number of
    // spacers
    var itemWidth = (maxWidth - (spacePerRow * spacing)) / itemsPerRow;

    // Partition the items into groups of itemsPerRow length and map them
    // to ResponsiveGridRow's
    var items = partition(children, itemsPerRow)
        .map<Widget>(
          (e) => ResponsiveGridRow(
            rowItems: e,
            spacing: spacing,
            itemWidth: itemWidth,
          ),
        )
        .toList();

    // Join the rows width spacing in between them (vertical)
    return joinWithWidget(items, SizedBox(height: spacing));
  }
}
