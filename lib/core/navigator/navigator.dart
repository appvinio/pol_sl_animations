import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

part 'navigator_screen.dart';

class CustomNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final FluroRouter router = FluroRouter.appRouter;
  static const defaultTransition = TransitionType.inFromLeft;
  static const initRoute = "/";

  static Future? _replace({
    required final BuildContext context,
    required final NavigatedScreen widget,
    required final String path,
    final TransitionType? transition = defaultTransition,
  }) {
    final route = ModalRoute?.of(context)?.settings.name ?? '';
    final targetPath = (route.split('/')
          ..removeLast()
          ..add(path))
        .join('/');
    _defineRoute(targetPath, transition);
    return router.navigateTo(context, targetPath,
        transition: transition,
        replace: true,
        routeSettings: RouteSettings(arguments: widget));
  }

  static Future? _post({
    required final BuildContext context,
    required final NavigatedScreen widget,
    required final String path,
    final TransitionType? transition = defaultTransition,
  }) {
    final route = ModalRoute?.of(context)?.settings.name ?? '';
    final targetPath = (route.split('/')..add(path)).join('/');
    _defineRoute(targetPath, transition);
    return router.navigateTo(
      context,
      targetPath,
      transition: transition,
      routeSettings: RouteSettings(arguments: widget),
    );
  }

  static Future? _addAboveBaseScreen({
    required final BuildContext context,
    required final NavigatedScreen widget,
    required final String path,
    final TransitionType? transition = defaultTransition,
  }) {
    final route = ModalRoute?.of(context)?.settings.name ?? '';
    final targetPath = (route.split('/')..add(path)).join('/');
    _defineRoute(targetPath, transition);
    Navigator.of(context).popUntil((final route) =>
        route.settings.name == route.settings.name?.split('/').first);
    return router.navigateTo(
      context,
      targetPath,
      transition: transition,
      routeSettings: RouteSettings(arguments: widget),
    );
  }

  static Future? _setAsBaseScreen({
    required final NavigatedScreen widget,
    required final String path,
    final TransitionType? transition = defaultTransition,
  }) {
    final state = navigatorKey.currentState;
    _defineRoute(path, transition);
    return state?.pushNamedAndRemoveUntil(
      path,
      (final _) => false,
      arguments: widget,
    );
  }

  static void _defineRoute(
      final String path, final TransitionType? transition) {
    router.define(path, handler: Handler(handlerFunc:
        (final BuildContext? context, final Map<String, dynamic> params) {
      if (context != null) {
        return ModalRoute.of(context)?.settings.arguments as Widget?;
      }
    }), transitionType: transition);
  }
}
