import 'package:flutter/widgets.dart';
import 'package:horizon_routing/src/entity/horizon_route.dart';

sealed class HorizonRouter {
  final GlobalKey<NavigatorState> navigatorKey;
  final List<HorizonRoute> routes;

  HorizonRouter({required this.routes}) : navigatorKey = GlobalKey<NavigatorState>();

  HorizonRouter.withNavigator({required this.navigatorKey, required this.routes});

  Future<T?> navigateTo<T extends Object?>(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> replaceWith<T extends Object?, R extends Object?>(String routeName, {Object? arguments, R? result}) {
    return navigatorKey.currentState!.pushReplacementNamed<T, R>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      routeName,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  Future<T?> goBackAndNavigateTo<T extends Object?, R extends Object?>(
    String routeName, {
    Object? arguments,
    R? result,
  }) {
    return navigatorKey.currentState!.popAndPushNamed<T, R>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  void goBack<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.pop(result);
  }

  BuildContext? get currentContext => navigatorKey.currentState?.context;
}
