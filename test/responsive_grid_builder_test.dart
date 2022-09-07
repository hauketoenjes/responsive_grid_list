import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  group(
    'Responsive Grid List Builder',
    () {
      testWidgets(
        'should render all children',
        (tester) async {
          final list = MaterialApp(
            home: ResponsiveGridListBuilder(
              minItemWidth: 10,
              minItemsPerRow: 2,
              horizontalGridSpacing: 20,
              verticalGridSpacing: 20,
              horizontalGridMargin: 16,
              verticalGridMargin: 16,
              rowMainAxisAlignment: MainAxisAlignment.center,
              gridItems: const [
                Text('Item'),
                Text('Item'),
                Text('Item'),
              ],
              builder: (BuildContext context, List<Widget> items) {
                return Column(
                  children: items,
                );
              },
            ),
          );

          await tester.pumpWidget(list);

          expect(find.text('Item'), findsNWidgets(3));
          expect(find.byType(Column), findsOneWidget);
        },
      );
    },
  );
}
