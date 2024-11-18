import 'package:barbershop/src/core/ui/widgets/button_day.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  final ValueChanged<String> onDayPressed;
  const WeekdaysPanel({super.key, required this.onDayPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Selecione os Dias da Semana',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonDay(
                label: 'seg',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Ter',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Qua',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Qui',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Sex',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Sab',
                onDayPressed: onDayPressed,
              ),
              ButtonDay(
                label: 'Dom',
                onDayPressed: onDayPressed,
              ),
            ],
          ),
        )
      ],
    );
  }
}
