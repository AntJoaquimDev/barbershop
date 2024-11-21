import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/widgets/time_button.dart';

class HoursPanel extends StatefulWidget {
  final int startTime;
  final int endTime;
  final ValueChanged<int> onHoursPressed;
 const HoursPanel({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.onHoursPressed,
  }) : super(key: key);

  @override
  State<HoursPanel> createState() => _HoursPanelState();
}

class _HoursPanelState extends State<HoursPanel> {
  @override
  Widget build(BuildContext context) {
    
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
            for (int i = widget.startTime; i <= widget.endTime; i++)
              TimeButton(
                label: '${i.toString().padLeft(2, '0')}:00',
                value: i,
                onHoursPressed: widget.onHoursPressed,
              )
          ],
        )
      ],
    );
  }
}
