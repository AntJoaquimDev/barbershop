import 'dart:ffi';

import 'package:barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';

class ButtonDay extends StatefulWidget {
  final String label;
  final ValueChanged<String> onDayPressed;
  
  const ButtonDay({
    super.key,
    required this.label, required this.onDayPressed,
  });

  @override
  State<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends State<ButtonDay> {
   bool selected=false;



  @override
  Widget build(BuildContext context) {
    final textColor= selected ? Colors.white:ColorsConstants.grey;
    var buttonColor= selected ? ColorsConstants.brow:Colors.white;
    final buttonBorderColor= selected ? ColorsConstants.brow: ColorsConstants.grey;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () { setState(() {
          widget.onDayPressed(widget.label);
          selected=!selected;
        });},
        child: Container(
          width: 40,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: buttonColor,
              border: Border.all(
                color: buttonBorderColor,
              )),
          child: Center(
              child: Text(
            widget.label,
            style:  TextStyle(
                fontSize: 12,
                color: textColor,
                fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}
