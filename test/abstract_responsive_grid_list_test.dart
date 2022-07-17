import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  group(
    'Abstract Responsive Grid List',
    () {
      testWidgets(
        'should render all children',
        (tester) async {
          const list = AbstractResponsiveGridListTest(
            minItemWidth: 10,
            minItemsPerRow: 1,
            horizontalGridSpacing: 16,
            verticalGridSpacing: 16,
            horizontalGridMargin: 16,
            verticalGridMargin: 16,
            rowMainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Item"),
              Text("Item"),
              Text("Item"),
              Text("Item"),
              Text("Item"),
            ],
          );

          await tester.pumpWidget(list);

          expect(find.text("Item"), findsNWidgets(5));
        },
      );
    },
  );
}

class AbstractResponsiveGridListTest extends AbstractResponsiveGridList {
  const AbstractResponsiveGridListTest({
    required double minItemWidth,
    required int minItemsPerRow,
    required double horizontalGridSpacing,
    required double verticalGridSpacing,
    required double horizontalGridMargin,
    required double verticalGridMargin,
    required MainAxisAlignment rowMainAxisAlignment,
    required List<Widget> children,
  }) : super(
          minItemWidth: minItemWidth,
          minItemsPerRow: minItemsPerRow,
          horizontalGridSpacing: horizontalGridSpacing,
          verticalGridSpacing: verticalGridSpacing,
          rowMainAxisAlignment: rowMainAxisAlignment,
          verticalGridMargin: verticalGridMargin,
          horizontalGridMargin: horizontalGridMargin,
          children: children,
        );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Get the grid list items
          final items = getResponsiveGridListItems(constraints.maxWidth);

          return Column(children: items);
        },
      ),
    );
  }
}
