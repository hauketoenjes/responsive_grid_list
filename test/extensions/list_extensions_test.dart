import 'package:responsive_grid_list/src/extensions/list_extensions.dart';
import 'package:test/test.dart';

void main() {
  test(
    'List should be joined with the separator value',
    () {
      final list = [1, 2, 3, 4, 5];

      final out = list.genericJoin(99);

      final expectedList = [1, 99, 2, 99, 3, 99, 4, 99, 5];

      expect(out, expectedList);
    },
  );
}
