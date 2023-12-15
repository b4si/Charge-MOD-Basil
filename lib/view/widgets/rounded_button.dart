import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.size,
    required this.function,
    required this.icon,
    required this.color,
  });

  final Size size;
  final VoidCallback function;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: size.width < 600 ? size.width * 0.14 : size.width * 0.07,
        width: size.width < 600 ? size.width * 0.14 : size.width * 0.07,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(size.width < 600 ? 30 : 60),
        ),
        child: icon,
      ),
    );
  }
}
