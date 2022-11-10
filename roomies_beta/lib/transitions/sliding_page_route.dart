import 'package:flutter/material.dart';

class SlidingPageRoute extends PageRouteBuilder {
  final Widget child;
  final String route;

  SlidingPageRoute({required this.child, required this.route})
      : super(
            transitionDuration: const Duration(milliseconds: 300),
            reverseTransitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            settings: RouteSettings(name: route));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child);
  }
}
