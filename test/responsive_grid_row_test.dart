import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  group('Responsive Grid Row', () {
    testWidgets(
        'Responsive Grid Row renders all rowItems with spacing in between',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ResponsiveGridRow(
            rowItems: [
              Text('Item'),
              Text('Item'),
              Text('Item'),
            ],
            spacing: 10,
            itemWidth: 20,
            rowMainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      );

      final itemFinder = find.text("Item");
      final itemBoxFinder = find.byWidgetPredicate(
        (e) => e is SizedBox && e.width == 20,
      );
      final spacingFinder = find.byWidgetPredicate(
        (e) => e is SizedBox && e.width == 10,
      );
      final rowFinder = find.byWidgetPredicate(
        (e) => e is Row && e.mainAxisAlignment == MainAxisAlignment.center,
      );

      expect(itemFinder, findsNWidgets(3));
      expect(itemBoxFinder, findsNWidgets(3));
      expect(spacingFinder, findsNWidgets(2));
      expect(rowFinder, findsOneWidget);
    });

    testWidgets('Responsive Grid Row renders spacing around the items',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: ResponsiveGridRow(
            rowItems: [
              Text('Item'),
              Text('Item'),
              Text('Item'),
            ],
            spacing: 10,
            itemWidth: 20,
            horizontalGridMargin: 30,
          ),
        ),
      );

      final spacingFinder = find.byWidgetPredicate(
        (e) => e is SizedBox && e.width == 30,
      );

      expect(spacingFinder, findsNWidgets(2));
    });
  });
}
