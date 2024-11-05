import 'package:asyncstate/asyncstate.dart';
import 'package:barbershop/src/core/restClient/interceptors/global_key_nav.dart';
import 'package:barbershop/src/core/ui/barbershop_theme.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/auth/register/register_page.dart';
import 'package:barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
        customLoader: const BarbershopLoader(),
        builder: (asyncNavigatorObserver) {
          return MaterialApp(
            navigatorKey: GlobalKeyNav.instance.navKey,
            theme: BarbershopTheme.themeData,
            title: 'Barber-Shoop',
            navigatorObservers: [asyncNavigatorObserver],
            routes: {
              '/': (_) => const SplashPage(),
              '/auth/login': (_) => const LoginPage(),
              '/auth/register/user': (_) => const RegisterPage(),
              '/home/adm': (_) => const Text('ADM'),
              '/home/employee': (_) => const Text('Employee'),
            },
          );
        });
  }
}
