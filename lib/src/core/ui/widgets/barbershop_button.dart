import 'package:flutter/material.dart';

class BarbershopButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  const BarbershopButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(56)),
          onPressed: onPressed,
          child: Text(label),
        ),
      );
    
  }
}
