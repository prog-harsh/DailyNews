import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // if (route.settings.isInitialRoute) {
    //   return child;
    // }
    return SizeTransition(
      sizeFactor: animation,
      child: child,
    );
  }
}
