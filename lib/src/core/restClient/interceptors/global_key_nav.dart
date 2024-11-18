
import 'package:flutter/material.dart';

class GlobalKeyNav {
  static GlobalKeyNav? _instance;
  final navKey=GlobalKey<NavigatorState>();
  // Avoid self instance
  GlobalKeyNav._();

  static GlobalKeyNav get instance =>
    _instance ??= GlobalKeyNav._();
}





