import 'package:flutter/material.dart';

import '../async_redux.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/async_redux

enum NavigateType { pushNamed, pushReplacementNamed, pushNamedAndRemoveAll, pop, popUntil }

/// For more info, see: https://pub.dartlang.org/packages/async_redux
class NavigateAction<St> extends ReduxAction<St> {
  static GlobalKey<NavigatorState> _navigatorKey;

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) =>
      _navigatorKey = navigatorKey;

  /// Trick explained here: https://github.com/flutter/flutter/issues/20451
  /// Note 'ModalRoute.of(context).settings.name' doesn't always work.
  static String getCurrentNavigatorRouteName(BuildContext context) {
    Route currentRoute;
    Navigator.popUntil(context, (route) {
      currentRoute = route;
      return true;
    });
    return currentRoute.settings.name;
  }

  NavigateType navigateType;
  String routeName;
  Object arguments;

  NavigateAction(this.routeName, {@required this.navigateType, this.arguments})
      : assert(navigateType != null),
        assert(navigateType == NavigateType.pop || routeName != null);

  NavigateAction.pop() : this(null, navigateType: NavigateType.pop);

  NavigateAction.pushNamed(
    String routeName, {
    Object arguments,
  }) : this(routeName, navigateType: NavigateType.pushNamed, arguments: arguments);

  NavigateAction.pushReplacementNamed(
    String routeName, {
    Object arguments,
  }) : this(routeName, navigateType: NavigateType.pushReplacementNamed, arguments: arguments);

  NavigateAction.pushNamedAndRemoveAll(
    String routeName, {
    Object arguments,
  }) : this(routeName, navigateType: NavigateType.pushNamedAndRemoveAll, arguments: arguments);

  NavigateAction.popUntil(String routeName) : this(routeName, navigateType: NavigateType.popUntil);

  @override
  St reduce() {
    if (_navigatorKey != null)
      switch (navigateType) {
        //
        case NavigateType.pop:
          _navigatorKey.currentState.pop();
          break;

        case NavigateType.pushNamed:
          _navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
          break;

        case NavigateType.pushReplacementNamed:
          _navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);
          break;

        case NavigateType.pushNamedAndRemoveAll:
          _navigatorKey.currentState.pushNamedAndRemoveUntil(
              routeName, (Route<dynamic> route) => false,
              arguments: arguments);
          break;

        case NavigateType.popUntil:
          _navigatorKey.currentState.popUntil(
            (Route<dynamic> route) => route.settings.name == routeName,
          );
          break;

        default:
          throw StoreException("Navigation not yet supported: $navigateType");
      }

    return null;
  }
}
