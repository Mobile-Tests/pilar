import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.duration,
    required this.onAnimationDone,
  });

  /// A custom animation duration.
  ///
  /// The animation itself should contain the necessary info for the total
  /// duration. This duration is to override the animation mostly for debug
  /// purposes.
  final Duration? duration;

  /// The callback fired only when the animation is done.
  final VoidCallback onAnimationDone;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            widget.onAnimationDone();
          });
        }
      });

    // Set the status bar to light content
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  void _startAnimation(double animationDuration) {
    final duration = widget.duration ??
        Duration(milliseconds: (animationDuration * 1000).toInt());
    _controller?.animateTo(1.0, duration: duration);
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Material(
      color: appTheme.colorScheme.primary,
      child: Center(
        child: Lottie.asset(
          'assets/animations/splash-animation.json',
          repeat: false,
          animate: false,
          controller: _controller,
          onLoaded: (composition) {
            // the predefined animation duration
            final duration =
                (composition.durationFrames / composition.frameRate)
                    .ceilToDouble();
            _startAnimation(duration);
          },
        ),
      ),
    );
  }
}
