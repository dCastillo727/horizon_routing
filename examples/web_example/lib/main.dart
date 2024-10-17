import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizon_routing/horizon_routing.dart';
import 'package:web/web.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterConfig(
        routerDelegate: TestDelegate(),
        routeInformationParser: TestParser(),
        routeInformationProvider: HorizonRouting.createAppRouter(),
      ),
      builder: (context, child) =>
          child ??
          Container(
            color: Colors.amber,
          ),
    );
  }
}

class TestDelegate<T> extends RouterDelegate<T> {
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  @override
  Future<bool> popRoute() {
    return SynchronousFuture<bool>(true); // true;
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(T configuration) {
    window.history.pushState(null, '', '/pepe');
    return SynchronousFuture<void>(null);
  }
}

class TestParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) {
    return SynchronousFuture('test');
  }
}
