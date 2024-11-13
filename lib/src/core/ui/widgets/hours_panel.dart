import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/time_button.dart';
import 'package:flutter/material.dart';

class HoursPanel extends StatelessWidget {
  final int startTime;
  final int endTime;
  const HoursPanel({
    super.key,
    required this.startTime,
    required this.endTime,
  });

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
            for (int i = startTime; i <= endTime; i++)
              TimeButton(
                label: '${i.toString().padLeft(2,'0')}:00',
              )
          ],
        )
      ],
    );
  }
}
