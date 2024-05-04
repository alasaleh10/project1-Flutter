import 'package:project1/core/validations/reqular_exceptions.dart';

validations({required String value, required String type}) {
  if (value.isEmpty) {
    return 'هذا الحقل مطلوب';
  }
  for (var i in RegularExceptions.disallowedSymbols) {
    if (value.startsWith(i) ||
        value.contains(' ') ||
        value.endsWith(i) ||
        value.endsWith(' ')) {
      return 'خطا في المدخلات';
    }
  }

  switch (type) {
    case 'email':
      if (value.length < 5) return 'البريد الإلكتروني يجب يكون اكبر من 4';
      if (value.contains(' ')) {
        return 'البريد الإلكتروني يجب ان لا يحتوي على مسافات';
      }
      if (!value.contains('@')) return 'خطا في إالبريد الإلكتروني';

      // for (int i = 0; i < RegularExceptions.disallowedSymbols.length - 3; i++) {
      //   if (value.contains(RegularExceptions.disallowedSymbols[i])) {
      //     return 'خطا في إالبريد الإلكتروني';
      //   }
      // }

      if (RegExp(RegularExceptions.noArabic).hasMatch(value)) {
        return 'إالبريد الإلكتروني يجب ان لايحتوي على حرف عربي';
      }

    // if (RegExp(RegularExceptions.userNameException).hasMatch(value)) {
    //   return 'خطا في إالبريد الإلكتروني';
    // }
    case 'password':
      if (value.length <= 6) return 'كلمة المرور يجب تكون اكبر من 6';
      if (value.length > 16) return 'كلمة المرور يجب ان تكون اصغر من 17';
      if (value.contains(' ')) return 'كلمة المرور يجب ان لاتحتوي على مسافات';

      for (var i in RegularExceptions.disallowedSymbols) {
        if (value.contains(i)) return 'كلمة المرور يجب ان لا تحتوي على رمز ';
      }

      if (!RegExp(RegularExceptions.musetContintLowerChar).hasMatch(value)) {
        return 'كلمة المرور يجب ان تحتوي على حرف ';
      }

      if (!RegExp(RegularExceptions.musetContintNumber).hasMatch(value)) {
        return 'كلمة المرور يجب ان تحتوي على رقم ';
      }

      if (RegExp(RegularExceptions.noArabic).hasMatch(value)) {
        return 'كلمة المرور يجب ان لاتحتوي على حرف عربي';
      }
  }
}
