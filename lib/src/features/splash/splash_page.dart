import 'dart:async';
import 'dart:developer';

import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/helpers/messages.dart';
import 'package:barbershop/src/features/auth/login/login_page.dart';
import 'package:barbershop/src/features/splash/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 100 * _scale;

  var endAnimation = false;
  Timer? redirectTimer;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
    super.initState();
  }

//!method for anamition. await
  void _redirect(String routerName) {
    if (!endAnimation) {
      redirectTimer?.cancel();
      redirectTimer = Timer(const Duration(milliseconds: 300), () {
        _redirect(routerName);
      });
    } else {
      redirectTimer?.cancel();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(routerName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashVmProvider, (_, state) {
      state.whenOrNull(error: (error, stackTrace) {
        log('erro ao validar o login', error: error, stackTrace: stackTrace);
        Messages.showError('erro ao validar o logim ', context);
        _redirect('/auth/login');
        // Navigator.of(context)
        //     .pushNamedAndRemoveUntil('/auth/login', (route) => false);
      }, data: (data) {
        switch (data) {
          case SplashState.loggedADM:
            _redirect('/home/adm');
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('/auth/adm', (route) => false);
          case SplashState.loggedEmployee:
            _redirect('/home/employee');
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('/auth/employee', (route) => false);
          case _:
            _redirect('/auth/login');
          // Navigator.of(context)
          //     .pushNamedAndRemoveUntil('/auth/login', (route) => false);
        }
      });
    });
    return Scaffold(
        backgroundColor: Colors.black,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.backgroundChair,
                ),
                opacity: 0.2,
                fit: BoxFit.cover),
          ),
          child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            opacity: _animationOpacityLogo,
            curve: Curves.easeIn,
            onEnd: () {
              setState(() {
                endAnimation = true;
              });
              // Navigator.of(context).pushAndRemoveUntil(
              //   PageRouteBuilder(
              //     settings: const RouteSettings(name: '/auth/login'),
              //     pageBuilder: (
              //       context,
              //       animation,
              //       secondaryAnimation,
              //     ) {
              //       return const LoginPage();
              //     },
              //     transitionsBuilder: (_, animation, __, child) {
              //       return FadeTransition(
              //         opacity: animation,
              //         child: child,
              //       );
              //     },
              //   ),
              //   (route) => false,
              // );
            },
            child: Center(
              child: AnimatedContainer(
                  width: _logoAnimationWidth,
                  height: _logoAnimationHeight,
                  duration: const Duration(seconds: 3),
                  curve: Curves.linearToEaseOut,
                  child: Image.asset(
                    ImageConstants.imageLogo,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ));
  }
}
