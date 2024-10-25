import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth=> 100 *_scale;
  double get _logoAnimationHeight=> 100 *_scale;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale=1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background_image_chair.jpg',
                ),
                opacity: 0.2,
                fit: BoxFit.cover),
          ),
          child: AnimatedOpacity(
            duration: Duration(seconds: 3),
            opacity: _animationOpacityLogo,
            curve: Curves.easeIn,
            child: Center(
              child: AnimatedContainer(
                width: _logoAnimationWidth,
                height: _logoAnimationHeight,
                  duration:const Duration(seconds: 3),
                  curve: Curves.linearToEaseOut,
                  child: Image.asset('assets/images/imgLogo.png',fit: BoxFit.cover,)),
            ),
          ),
        ));
  }
}
