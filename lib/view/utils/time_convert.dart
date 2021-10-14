import 'package:jiffy/jiffy.dart';

String time(createdAt) {
  try {
    final count = '-'.allMatches(createdAt).length;
    if (count <= 1) {
      return Jiffy('$createdAt-1').format("yMMMMd");
    } else {
      return Jiffy(createdAt).format("yMMMMd");
    }
  } catch (e) {
    return Jiffy('2021-10-1').format("yMMMMd");
  }
}
