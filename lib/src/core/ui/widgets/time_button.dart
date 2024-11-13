import 'package:flutter/material.dart';

import 'package:barbershop/src/core/ui/constants.dart';

class TimeButton extends StatelessWidget {
  final String label;

  const TimeButton({
    Key? key,
    required this.label,
  }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        width: 64,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(
            color: ColorsConstants.grey,
          ),
        ),
        child:  Center(child:  Text(label,style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: ColorsConstants.grey),)),
      ),
    );
  }
}
