import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:horizon_routing/src/entity/horizon_guard.dart';
import 'package:horizon_routing/src/entity/run_guards_on.dart';

typedef HLazyWidgetBuilder = FutureOr<Widget> Function();

typedef HorizonRoutes = List<HorizonRoute>;

typedef HLazyRoutesBuilder = FutureOr<HorizonRoutes> Function();

enum HPathMatch { prefix, exact }

final class HorizonRoute {
  final String? title;
  final String path;
  final HPathMatch pathMatch;
  //final HPathBuilder? pathBuilder;
  final Widget? page;
  final HLazyWidgetBuilder? lazyBuilder;
  final String? rediredtTo;
  final List<HGuard>? canAccess;
  final HorizonRoutes? children;
  final HLazyRoutesBuilder? childrenBuilder;
  final RunGuardsOn runGuardsOn;

  const HorizonRoute({
    this.title,
    this.path = '/',
    this.pathMatch = HPathMatch.prefix,
    this.page,
    this.lazyBuilder,
    this.rediredtTo,
    this.canAccess,
    this.children,
    this.childrenBuilder,
    this.runGuardsOn = RunGuardsOn.paramsChange,
  });
}
