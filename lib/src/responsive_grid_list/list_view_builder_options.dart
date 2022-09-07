// coverage:ignore-file
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

///
/// Object that exposes all available options for a
/// [ListView.builder].
///
class ListViewBuilderOptions {
  /// Constructor of [ListViewBuilderOptions].
  ListViewBuilderOptions({
    this.scrollDirection,
    this.reverse,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap,
    this.padding,
    this.itemExtent,
    this.prototypeItem,
    this.findChildIndexCallback,
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.addSemanticIndexes,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior,
    this.keyboardDismissBehavior,
    this.restorationId,
    this.clipBehavior,
  });

  /// See [ListView.builder.scrollDirection] for more information.
  final Axis? scrollDirection;

  /// See [ListView.builder.reverse] for more information.
  final bool? reverse;

  /// See [ListView.builder.controller] for more information.
  final ScrollController? controller;

  /// See [ListView.builder.primary] for more information.
  final bool? primary;

  /// See [ListView.builder.physics] for more information.
  final ScrollPhysics? physics;

  /// See [ListView.builder.shrinkWrap] for more information.
  final bool? shrinkWrap;

  /// See [ListView.builder.padding] for more information.
  final EdgeInsetsGeometry? padding;

  /// See [ListView.builder.itemExtent] for more information.
  final double? itemExtent;

  /// See [ListView.builder.prototypeItem] for more information.
  final Widget? prototypeItem;

  /// See [ListView.builder.findChildIndexCallback] for more information.
  final ChildIndexGetter? findChildIndexCallback;

  /// See [ListView.builder.addAutomaticKeepAlives] for more information.
  final bool? addAutomaticKeepAlives;

  /// See [ListView.builder.addRepaintBoundaries] for more information.
  final bool? addRepaintBoundaries;

  /// See [ListView.builder.addSemanticIndexes] for more information.
  final bool? addSemanticIndexes;

  /// See [ListView.builder.cacheExtent] for more information.
  final double? cacheExtent;

  /// See [ListView.builder.semanticChildCount] for more information.
  final int? semanticChildCount;

  /// See [ListView.builder.dragStartBehavior] for more information.
  final DragStartBehavior? dragStartBehavior;

  /// See [ListView.builder.keyboardDismissBehavior] for more information.
  final ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior;

  /// See [ListView.builder.restorationId] for more information.
  final String? restorationId;

  /// See [ListView.builder.clipBehavior] for more information.
  final Clip? clipBehavior;
}
