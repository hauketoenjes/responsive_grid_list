import 'package:flutter/widgets.dart';

///
/// Method which joins [widget] in between the items in [list].
///
/// Does the same as the [Iterable.join()] method but instead of return a string,
/// retuns the list with seperator widgets in between.
///
List<Widget> joinWithWidget(List<Widget> list, Widget widget) {
  var out = <Widget>[];
  var iterator = list.iterator;

  if (!iterator.moveNext()) return out;

  out.add(iterator.current);
  while (iterator.moveNext()) {
    out.add(widget);
    out.add(iterator.current);
  }
  return out;
}
