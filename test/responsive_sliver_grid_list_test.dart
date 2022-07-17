import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  group(
    'Responsive Sliver Grid List Builder',
    () {
      testWidgets(
        'should render all children',
        (tester) async {
          const list = MaterialApp(
            home: CustomScrollView(
              slivers: [
                ResponsiveSliverGridList(
                  minItemWidth: 10,
                  minItemsPerRow: 2,
                  horizontalGridSpacing: 20,
                  verticalGridSpacing: 20,
                  horizontalGridMargin: 16,
                  verticalGridMargin: 16,
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Item"),
                    Text("Item"),
                    Text("Item"),
                    Text("Item"),
                  ],
                ),
              ],
            ),
          );

          await tester.pumpWidget(list);

          expect(find.text("Item"), findsNWidgets(4));
        },
      );
    },
  );
}
