// lib/src/utils/password_strength_calculator.dart

class PasswordStrengthResult {
  final double strength;
  final String text;

  PasswordStrengthResult({
    required this.strength,
    required this.text,
  });
}

PasswordStrengthResult calculatePasswordStrength(
    String password,
    ) {
  int score = 0;

  if (password.length >= 8) score++;
  if (RegExp(r'[A-Z]').hasMatch(password)) score++;
  if (RegExp(r'[a-z]').hasMatch(password)) score++;
  if (RegExp(r'[0-9]').hasMatch(password)) score++;
  if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password)) score++;

  if (score <= 2) {
    return PasswordStrengthResult(
      strength: score / 5,
      text: 'Weak',
    );
  }

  if (score <= 4) {
    return PasswordStrengthResult(
      strength: score / 5,
      text: 'Medium',
    );
  }

  return PasswordStrengthResult(
    strength: score / 5,
    text: 'Strong',
  );
}