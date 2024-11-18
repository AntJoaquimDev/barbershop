import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/constants.dart';

class TimeButton extends StatefulWidget {
  final String label;
  final int value;
  final ValueChanged<int> onHoursPressed;
  const TimeButton({
    Key? key,
    required this.label,
    required this.onHoursPressed,
    required this.value,
  }) : super(key: key);

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  var selected = false;
  @override
  Widget build(BuildContext context) {
    final textColor = selected ? Colors.white : ColorsConstants.grey;
    var buttonColor = selected ? ColorsConstants.brow : Colors.white;
    final buttonBorderColor =
        selected ? ColorsConstants.brow : ColorsConstants.grey;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        widget.onHoursPressed(widget.value);
        selected = !selected;
      },
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: Border.all(
            color: buttonBorderColor,
          ),
        ),
        child: Center(
            child: Text(
          widget.label,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
        )),
      ),
    );
  }
}
