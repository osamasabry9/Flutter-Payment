import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/color_manager.dart';

class DefaultButton extends StatelessWidget {
  final Widget buttonWidget;
  final Function() function;
  final double width;
  final Color backgroundColor;
  final bool isUpperCase;
  final double radius;
  const DefaultButton({
    super.key,
    required this.buttonWidget,
    required this.function,
    this.width = double.infinity,
    this.backgroundColor = ColorManager.primary,
    this.isUpperCase = true,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: MaterialButton(
        onPressed: function,
        child: buttonWidget,
      ),
    );
  }
}
