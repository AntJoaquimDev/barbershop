import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/button_day.dart';
import 'package:flutter/material.dart';

class WeekdaysPanel extends StatelessWidget {
  const WeekdaysPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selecione os Dias da Semana',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonDay(label: 'seg',),
              ButtonDay(label: 'Ter',),
              ButtonDay(label: 'Qua',),
              ButtonDay(label: 'Qui',),
              ButtonDay(label: 'Sex',),
              ButtonDay(label: 'Sab',),
              ButtonDay(label: 'Dom',),
            ],
          ),
        )
      ],
    );
  }
}

