abstract class RegularExceptions {
  static String userNameException = 'r^[_-]';

  static const String passwordException =
      'r^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,16}';

  static String musetNotHasSpace = r'^[^\s]+$';
  static String musetContintNumber = r'^(?=.*[0-9])';
  static String musetContintLowerChar = r'^(?=.*[a-z])';
  static String musetContintUperChar = r'^(?=.*[A-Z])';
  static String symbols = r'^[^!@#$%^&*()_+=\[\]{};://|,.<>//?]';
  static String noArabic = r'^[أ-ي]';
  static List<String> disallowedSymbols = [
    '!',
    '@',
    '#',
    '%',
    '^',
    '&',
    '*',
    '(',
    ')',
    '+',
    '=',
    '[',
    ']',
    '{',
    '}',
    ';',
    ':',
    "'",
    '\\',
    '|',
    ',',
    '<',
    '>',
    '/',
    '?',
    '؟',
    '\$',
    '_',
    '-',
    '.',
  ];
}
// symbolقبول ال
