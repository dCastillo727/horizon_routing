import 'dart:developer';

import 'package:flutter/widgets.dart';

class HorizonRouteInformationProvider extends PlatformRouteInformationProvider {
  HorizonRouteInformationProvider({required super.initialRouteInformation});

  @override
  void routerReportsNewRouteInformation(
    RouteInformation routeInformation, {
    RouteInformationReportingType type = RouteInformationReportingType.none,
  }) {
    log('HorizonRouteInformationProvider: $routeInformation');
    super.routerReportsNewRouteInformation(routeInformation, type: type);
  }
}
