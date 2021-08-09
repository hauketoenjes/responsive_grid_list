///
/// Method which joins [seperator] in between the items in [list].
///
/// Does the same as the [Iterable.join()] method but instead of returning a string,
/// retuns the list with seperators in between.
///
List<T> genericJoin<T>(List<T> list, T seperator) {
  final out = <T>[];
  final iterator = list.iterator;

  if (!iterator.moveNext()) return out;

  out.add(iterator.current);
  while (iterator.moveNext()) {
    out.add(seperator);
    out.add(iterator.current);
  }
  return out;
}
