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
              Text('Item'),
              Text('Item'),
              Text('Item'),
              Text('Item'),
              Text('Item'),
            ],
          );

          await tester.pumpWidget(list);

          expect(find.text('Item'), findsNWidgets(5));
        },
      );
    },
  );
}

class AbstractResponsiveGridListTest extends AbstractResponsiveGridList {
  const AbstractResponsiveGridListTest({
    required super.minItemWidth,
    required super.minItemsPerRow,
    required super.horizontalGridSpacing,
    required super.verticalGridSpacing,
    required super.horizontalGridMargin,
    required super.verticalGridMargin,
    required super.rowMainAxisAlignment,
    required super.children,
    super.key,
  });

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
