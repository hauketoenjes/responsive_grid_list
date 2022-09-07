import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/abstract_responsive_grid_list.dart';
import 'package:responsive_grid_list/src/responsive_grid_list/list_view_builder_options.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [ListView.builder()]
///
class ResponsiveGridList extends AbstractResponsiveGridList {
  /// Constructor of [ResponsiveGridList].
  const ResponsiveGridList({
    super.key,
    required super.minItemWidth,
    super.minItemsPerRow = 1,
    super.maxItemsPerRow,
    super.horizontalGridSpacing = 16,
    super.verticalGridSpacing = 16,
    super.horizontalGridMargin,
    super.verticalGridMargin,
    super.rowMainAxisAlignment = MainAxisAlignment.start,
    required super.children,
    @Deprecated('Use listViewBuilderOptions instead') this.shrinkWrap = false,
    this.listViewBuilderOptions,
    // coverage:ignore-start
  });

  /// shrinkWrap property of [ListView.builder].
  @Deprecated('Use listViewBuilderOptions.shrinkWrap instead')
  final bool shrinkWrap; // coverage:ignore-end

  ///
  /// Object that can be set if any of the [ListView.builder] options
  /// need to be overridden. The [ResponsiveGridList] defines the builder
  /// and item count. All other options are optional and can be set through
  /// this object.
  ///
  final ListViewBuilderOptions? listViewBuilderOptions;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.maxWidth);

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return items[index];
          },
          scrollDirection:
              listViewBuilderOptions?.scrollDirection ?? Axis.vertical,
          reverse: listViewBuilderOptions?.reverse ?? false,
          controller: listViewBuilderOptions?.controller,
          primary: listViewBuilderOptions?.primary,
          physics: listViewBuilderOptions?.physics,
          // TODO(hauketoenjes): Remove this when the shrinkWrap property
          // is removed
          // ignore: deprecated_member_use_from_same_package
          shrinkWrap: listViewBuilderOptions?.shrinkWrap ?? shrinkWrap,
          padding: listViewBuilderOptions?.padding,
          itemExtent: listViewBuilderOptions?.itemExtent,
          prototypeItem: listViewBuilderOptions?.prototypeItem,
          findChildIndexCallback:
              listViewBuilderOptions?.findChildIndexCallback,
          addAutomaticKeepAlives:
              listViewBuilderOptions?.addAutomaticKeepAlives ?? true,
          addRepaintBoundaries:
              listViewBuilderOptions?.addRepaintBoundaries ?? true,
          addSemanticIndexes:
              listViewBuilderOptions?.addSemanticIndexes ?? true,
          cacheExtent: listViewBuilderOptions?.cacheExtent,
          semanticChildCount: listViewBuilderOptions?.semanticChildCount,
          dragStartBehavior: listViewBuilderOptions?.dragStartBehavior ??
              DragStartBehavior.start,
          keyboardDismissBehavior:
              listViewBuilderOptions?.keyboardDismissBehavior ??
                  ScrollViewKeyboardDismissBehavior.manual,
          restorationId: listViewBuilderOptions?.restorationId,
          clipBehavior: listViewBuilderOptions?.clipBehavior ?? Clip.hardEdge,
        );
      },
    );
  }
}
