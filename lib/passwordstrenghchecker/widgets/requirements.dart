import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  final String text;
  final bool isSatisfied;
  final IconData isSatisfiedtrueIcon;
  final Color isSatisfiedtrueIconColor;
  final IconData isSatisfiedfasleIcon;
  final Color isSatisfiedfalseIconColor;
  final IconData isEmplyIcon;
  final Color isEmplyIconColor;
  final TextEditingController passwordCtrl;

  const Requirements({
    super.key,
    required this.text,
    required this.isSatisfied,
    required this.passwordCtrl,
    this.isSatisfiedtrueIcon = Icons.check_circle,
    this.isSatisfiedfasleIcon = Icons.cancel,
    this.isEmplyIcon=Icons.radio_button_unchecked,

    this.isEmplyIconColor=Colors.grey,
    this.isSatisfiedtrueIconColor=Colors.green,
    this.isSatisfiedfalseIconColor=Colors.red,
  });


  @override
  Widget build(BuildContext context) {
    bool isEmpty = passwordCtrl.text.isEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            isEmpty ? isEmplyIcon : isSatisfied ? isSatisfiedtrueIcon : isSatisfiedfasleIcon,
            color: isEmpty
                ? isEmplyIconColor
                : isSatisfied
                ? isSatisfiedtrueIconColor
                : isSatisfiedfalseIconColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: isEmpty
                    ? isEmplyIconColor : isSatisfied
                    ? isSatisfiedtrueIconColor : isSatisfiedfalseIconColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
