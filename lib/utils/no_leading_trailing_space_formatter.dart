import 'package:flutter/services.dart';

class NoLeadingTrailingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.startsWith(' ')) {
      final String val = newValue.text.trimLeft();

      return TextEditingValue(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );
    }
    if (newValue.text.endsWith(' ')) {
      final String val = newValue.text.trimRight();

      return TextEditingValue(
        text: val,
        selection: TextSelection(
          baseOffset: val.length,
          extentOffset: val.length,
        ),
      );
    }
    return newValue;
  }
}
