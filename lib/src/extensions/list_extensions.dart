extension GenericJoin<T> on List<T> {
  ///
  /// Extension which joins [seperator] in between the items in [List].
  ///
  /// Does the same as the [join()] method but instead of returning a string,
  /// retuns the list with seperators in between. Mainly used to join Widgets in
  /// between other widgets.
  ///
  /// See: https://api.dart.dev/stable/dart-core/Iterable/join.html
  ///
  List<T> genericJoin(T seperator) {
    final out = <T>[];
    final iterator = this.iterator;

    if (!iterator.moveNext()) return out;

    out.add(iterator.current);
    while (iterator.moveNext()) {
      out.add(seperator);
      out.add(iterator.current);
    }
    return out;
  }
}
