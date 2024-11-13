import 'package:barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class ButtonDay extends StatelessWidget {
  final String label;
  const ButtonDay({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () { print(label);},
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(
                color: ColorsConstants.grey,
              )),
          child: Center(
              child: Text(
            label,
            style: const TextStyle(
                fontSize: 12,
                color: ColorsConstants.grey,
                fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}
