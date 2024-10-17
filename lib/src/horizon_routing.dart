import 'package:flutter/widgets.dart';
import 'package:horizon_routing/src/utils/horizon_route_information_provider.dart';

class HorizonRouting {
  static final RouteInformation _information = RouteInformation(uri: Uri(path: '/'));
  static HorizonRouteInformationProvider createAppRouter() =>
      HorizonRouteInformationProvider(initialRouteInformation: _information);
}
