# responsive_grid_list

A Flutter plugin to create responsive grid lists using `ListView.builder()` or `SliverList` with a `SliverChildBuilderDelegate`.

The provided Widgets essentially work like a Flutter `Wrap` Widget but they are more performant with large lists because of the internal use of `ListView.builder()` functions. 

The items in the grid are all the same width and have the same height per row. This means when a `Card` widget for example is higher because of a large description or so, the whole row will get higher. The row after that can be lower since it will be the height of it's highest child.

## Usage
```dart
import 'package:responsive_grid_list/responsive_grid_list.dart';
```

### ResponsiveGridList

A Responsive Grid List which uses `ListView.builder()` internally.

```dart
ResponsiveGridList(
    spacing: 16, // The vertical and horizontal spacing
    minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
    children: [...], // The list of widgets in the list
);
```
### ResponsiveSliverGridList

A Responsive Grid List which uses `SliverList` with a `SliverChildBuilderDelegate` internally.

```dart
ResponsiveSliverGridList(
    spacing: 16, // The vertical and horizontal spacing
    minItemWidth: 300, // The minimum item width (can be smaller, if the layout constraints are smaller)
    children: [...], // The list of widgets in the list
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

