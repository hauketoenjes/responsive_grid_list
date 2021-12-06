# Responsive Grid List

A Flutter plugin to create responsive grid lists using `ListView.builder()`, `SliverList` with a `SliverChildBuilderDelegate` or any other list.

The provided Widgets essentially work like a Flutter `Wrap` Widget but they are more performant with large lists because of the internal use of `ListView.builder()` functions. 

The items in the grid are all the same width and have the same height per row. This means when a `Card` widget for example is higher because of a large description or so, the whole row will get higher. The row after that can be lower since it will be the height of it's highest child.

## Screenshots

Mobile | Desktop
:-:|:-:
<img alt="Mobile Example" src="https://raw.githubusercontent.com/hauketoenjes/responsive_grid_list/main/screenshots/mobile.png"/>|<img alt="Mobile Example" src="https://raw.githubusercontent.com/hauketoenjes/responsive_grid_list/main/screenshots/desktop.png"/>

## Usage
```dart
import 'package:responsive_grid_list/responsive_grid_list.dart';
```

### ResponsiveGridList

A Responsive Grid List which uses `ListView.builder()` internally.

```dart
ResponsiveGridList(
    horizontalGridSpacing: 16, // Horizontal space between grid items
    horizontalGridSpacing: 16, // Vertical space between grid items
    horizontalGridMargin: 50, // Horizontal space around the grid
    verticalGridMargin: 50, // Vertical space around the grid
    minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
    maxItemsPerRow: 2, // The maximum items to show in a single row. Can be useful on large screens
    shrinkWrap: true, // shrinkWrap property of the ListView.builder()
    children: [...], // The list of widgets in the list
);
```
### ResponsiveSliverGridList

A Responsive Grid List which uses `SliverList` with a `SliverChildBuilderDelegate` internally.

```dart
ResponsiveSliverGridList(
    horizontalGridSpacing: 16, // Horizontal space between grid items
    verticalGridSpacing: 16, // Vertical space between grid items
    horizontalGridMargin: 50, // Horizontal space around the grid
    verticalGridMargin: 50, // Vertical space around the grid
    minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
    maxItemsPerRow, // The maximum items to show in a single row. Can be useful on large screens
    children: [...], // The list of widgets in the list
);
```

### ResponsiveGridListBuilder

A Responsive Grid List which offers a `builder` in which every List / Column can be used with this package.

```dart
ResponsiveGridListBuilder(
    horizontalGridSpacing: 16, // Horizontal space between grid items
    horizontalGridSpacing: 16, // Vertical space between grid items
    horizontalGridMargin: 50, // Horizontal space around the grid
    verticalGridMargin: 50, // Vertical space around the grid
    minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
    maxItemsPerRow: 2, // The maximum items to show in a single row. Can be useful on large screens
    gridItems: [...], // The list of widgets in the grid
    builder: (context, items) {
      // Place to build a List or Column to access all properties.
      // Set [items] as children attribute for example.
    }
);
```

## Extending `AbstractResponsiveGridList`

To create a Responsive Grid you can extend the `AbstractResponsiveGridList` class and access the `getResponsiveGridListItems(double maxWidth)` function to generate the grid and pipe it into your custom list.

```dart
class MyResponsiveGridList extends AbstractResponsiveGridList{
   /// Constructor etc...
  [...]

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        
        // The abstract class has a function to generate the grid from 
        // the constructor's paramters and the layout constraints max width
        var items = getResponsiveGridListItems(constraints.maxWidth);

        return [...]
      },
    );
  }
}
```

## Future Features
- [x] Optional padding at the edges of the grid
- [ ] Unit tests
- [ ] Optional delta in which the width of the children can vary instead of setting the just the minimum width
- [ ] Option to constrain the height of the items to a fixed value
  - Probably better to use the Flutter `GridView` instead. It offers `aspectRation`.


