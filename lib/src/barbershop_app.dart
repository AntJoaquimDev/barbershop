import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      
      builder: (asyncNavigatorObserver) {
      return MaterialApp(theme: BarbershopTheme.themeData,
        title: 'Barber-Shoop',
        navigatorObservers: [
          asyncNavigatorObserver,
        ],
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login': (_) => const LoginPage(),
          '/home/adm': (_) => const Text('Adm'),
          '/home/employee': (_) => const Text('employee'),
        },
      );
    });
  }
}
