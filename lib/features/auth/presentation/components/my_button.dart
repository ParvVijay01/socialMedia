import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        
        // Padding inside
        padding: const EdgeInsets.all(
          25,
        ),
        decoration: BoxDecoration(
          // button color
          color: Theme.of(context).colorScheme.tertiary,

          // Curved corners
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
