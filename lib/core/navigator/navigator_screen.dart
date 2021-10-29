part of 'navigator.dart';

mixin NavigatedScreen on StatefulWidget {
  String get routeName;

  Future? setAsBaseScreen({final TransitionType? transition}) =>
      CustomNavigator._setAsBaseScreen(widget: this, path: routeName, transition: transition);

  Future? addScreen(final BuildContext context, {final TransitionType? transition}) =>
      CustomNavigator._post(context: context, widget: this, path: routeName, transition: transition);

  Future? addAboveBaseScreen(final BuildContext context, {final TransitionType? transition}) =>
      CustomNavigator._addAboveBaseScreen(context: context, widget: this, path: routeName, transition: transition);

  Future? replaceTopScreen(final BuildContext context, {final TransitionType? transition}) =>
      CustomNavigator._replace(context: context, widget: this, path: routeName, transition: transition);
}
