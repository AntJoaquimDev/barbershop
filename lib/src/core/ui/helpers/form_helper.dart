import 'package:flutter/material.dart';

void unfocus(BuildContext context)=>FocusScope.of(context).unfocus();
extension unfocusExtension on BuildContext{
  void unfocus()=>Focus.of(this).unfocus();
}