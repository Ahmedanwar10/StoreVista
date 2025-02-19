import 'package:advanced_1/app/constant.dart';

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constant.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constant.empty;
    } else {
      return this!;
    }
  }
}
