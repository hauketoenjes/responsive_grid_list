// coverage:ignore-file
import 'package:flutter/widgets.dart';

///
/// Object that exposes all available options for a
/// [SliverChildBuilderDelegate].
///
class SliverChildBuilderDelegateOptions {
  /// Constructor of [SliverChildBuilderDelegateOptions].
  SliverChildBuilderDelegateOptions({
    this.findChildIndexCallback,
    this.addAutomaticKeepAlives,
    this.addRepaintBoundaries,
    this.addSemanticIndexes,
    this.semanticIndexCallback,
    this.semanticIndexOffset,
  });

  /// See [SliverChildBuilderDelegate.findChildIndexCallback].
  final int? Function(Key)? findChildIndexCallback;

  /// See [SliverChildBuilderDelegate.addAutomaticKeepAlives]
  final bool? addAutomaticKeepAlives;

  /// See [SliverChildBuilderDelegate.addRepaintBoundaries]
  final bool? addRepaintBoundaries;

  /// See [SliverChildBuilderDelegate.addSemanticIndexes]
  final bool? addSemanticIndexes;

  /// See [SliverChildBuilderDelegate.semanticIndexCallback]
  final int? Function(Widget, int)? semanticIndexCallback;

  /// See [SliverChildBuilderDelegate.semanticIndexOffset]
  final int? semanticIndexOffset;
}
