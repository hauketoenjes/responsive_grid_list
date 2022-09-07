import 'package:flutter/widgets.dart';
import 'package:responsive_grid_list/src/abstract_responsive_grid_list.dart';
import 'package:responsive_grid_list/src/responsive_sliver_grid_list/sliver_child_builder_delegate_options.dart';

///
/// An [AbstractResponsiveGridList] returning the grid inside a
/// [SliverList] with a [SliverChildBuilderDelegate]
///
class ResponsiveSliverGridList extends AbstractResponsiveGridList {
  /// Constructor of [ResponsiveSliverGridList].
  const ResponsiveSliverGridList({
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
    this.sliverChildBuilderDelegateOptions,
    // coverage:ignore-start
  }); // coverage:ignore-end

  ///
  /// Object that can be set if any of the [SliverList] options need to be
  /// overridden. The [ResponsiveSliverGridList] is created with a
  /// [SliverChildBuilderDelegate] which defines the builder method
  /// and the child count. All other options are optional and can
  /// be set through this object.
  ///
  final SliverChildBuilderDelegateOptions? sliverChildBuilderDelegateOptions;

  int _kDefaultSemanticIndexCallback(Widget _, int localIndex) => localIndex;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (context, constraints) {
        // Get the grid list items
        final items = getResponsiveGridListItems(constraints.crossAxisExtent);

        // Return the SliverList with a SliverChildBuilderDelegate
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return items[index];
            },
            childCount: items.length,
            findChildIndexCallback:
                sliverChildBuilderDelegateOptions?.findChildIndexCallback,
            addAutomaticKeepAlives:
                sliverChildBuilderDelegateOptions?.addAutomaticKeepAlives ??
                    true,
            addRepaintBoundaries:
                sliverChildBuilderDelegateOptions?.addRepaintBoundaries ?? true,
            addSemanticIndexes:
                sliverChildBuilderDelegateOptions?.addSemanticIndexes ?? true,
            semanticIndexCallback:
                sliverChildBuilderDelegateOptions?.semanticIndexCallback ??
                    _kDefaultSemanticIndexCallback,
            semanticIndexOffset:
                sliverChildBuilderDelegateOptions?.semanticIndexOffset ?? 0,
          ),
        );
      },
    );
  }
}
