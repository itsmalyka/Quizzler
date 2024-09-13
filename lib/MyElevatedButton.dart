import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final VoidCallback? onPressed;
  final Widget child;
  final Color gradientcolor1;
  final Color gradientcolor2;
  final Icon? icon; // New parameter for icon

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradientcolor1 = Colors.pink,
    this.gradientcolor2 = Colors.indigo,
    this.icon, // Initialize icon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(colors: [gradientcolor1, gradientcolor2]);

    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent, // Make button background transparent
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        icon: icon != null ? Icon(
          icon!.icon,
          color: Colors.white,): // Set icon color to white
         SizedBox(), // Display icon if provided, or SizedBox if null
        label: child, // Use the child widget as the button label
      ),
    );
  }
}
