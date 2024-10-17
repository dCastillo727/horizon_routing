import 'package:flutter/widgets.dart';

class HorizonRouteInformationProvider extends PlatformRouteInformationProvider {
  HorizonRouteInformationProvider({required super.initialRouteInformation});

  @override
  void routerReportsNewRouteInformation(
    RouteInformation routeInformation, {
    RouteInformationReportingType type = RouteInformationReportingType.none,
  }) {
    print('HorizonRouteInformationProvider: $routeInformation');
    super.routerReportsNewRouteInformation(routeInformation, type: type);
  }
}
