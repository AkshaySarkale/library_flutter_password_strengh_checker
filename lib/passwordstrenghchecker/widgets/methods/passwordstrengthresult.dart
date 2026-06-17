class PasswordStrengthResult {
  final double strength;
  final String text;

  final bool hasMinLength;
  final bool hasUpperCase;
  final bool hasLowerCase;
  final bool hasNumber;
  final bool hasSpecialChar;

  const PasswordStrengthResult({
    required this.strength,
    required this.text,
    required this.hasMinLength,
    required this.hasUpperCase,
    required this.hasLowerCase,
    required this.hasNumber,
    required this.hasSpecialChar,
  });
}

PasswordStrengthResult calculatePasswordStrength(
    String password,
    ) {
  final hasMinLength = password.length >= 8;
  final hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
  final hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
  final hasNumber = RegExp(r'[0-9]').hasMatch(password);
  final hasSpecialChar =
  RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);

  int score = 0;

  if (hasMinLength) score++;
  if (hasUpperCase) score++;
  if (hasLowerCase) score++;
  if (hasNumber) score++;
  if (hasSpecialChar) score++;

  String text;

  if (password.isEmpty) {
    text = 'Enter Password';
  } else if (score <= 2) {
    text = 'Weak';
  } else if (score <= 4) {
    text = 'Medium';
  } else {
    text = 'Strong';
  }

  return PasswordStrengthResult(
    strength: score / 5,
    text: text,
    hasMinLength: hasMinLength,
    hasUpperCase: hasUpperCase,
    hasLowerCase: hasLowerCase,
    hasNumber: hasNumber,
    hasSpecialChar: hasSpecialChar,
  );
}