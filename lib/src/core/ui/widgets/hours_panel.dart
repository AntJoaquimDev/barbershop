import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/time_button.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;

  final ValueChanged<int> onHoursPressed;
 HoursPanel({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.onHoursPressed,
  }) : super(key: key);

  bool selected = false;

  @override
  Widget build(BuildContext context) {
     final textColor= selected ? Colors.white:ColorsConstants.grey;
    var buttonColor= selected ? ColorsConstants.brow:Colors.white;
    final buttonBorderColor= selected ? ColorsConstants.brow: ColorsConstants.grey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os horários de atendimento',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            for (int i = startTime; i <= endTime; i++)
              TimeButton(
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                onHoursPressed: onHoursPressed,
              )
          ],
        )
      ],
    );
  }
}
