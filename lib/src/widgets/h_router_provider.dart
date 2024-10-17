import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:horizon_routing/src/entity/horizon_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HRouterProvider<T extends HorizonRouter> extends SingleChildStatelessWidget {
  final Create<T>? _create;
  final bool lazy;
  final T? _value;

  const HRouterProvider({
    super.key,
    required Create<T> create,
    required super.child,
    this.lazy = true,
  })  : _create = create,
        _value = null;

  const HRouterProvider.value({
    required T value,
    super.key,
    super.child,
  })  : _value = value,
        _create = null,
        lazy = true;

  static T of<T extends HorizonRouter>(BuildContext context, {bool listen = false}) {
    try {
      return Provider.of<T>(context, listen: listen);
    } on ProviderNotFoundException catch (e) {
      if (e.valueType != T) rethrow;
      throw FlutterError(
        '''
        HRouterProvider.of() called with a context that does not contain a $T.
        No ancestor could be found starting from the context that was passed to HRouterProvider.of<$T>().

        This can happen if the context you used comes from a widget above the $T.

        The context used was: $context
        ''',
      );
    }
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    assert(child != null, '$runtimeType must specify a child');

    return _value != null
        ? InheritedProvider<T>.value(
            value: _value,
            lazy: lazy,
            child: child,
          )
        : InheritedProvider<T>(
            create: _create,
            lazy: lazy,
            child: child,
          );
  }

  // static VoidCallback _startListening(
  //   InheritedContext<HorizonRouter?> e,
  //   HorizonRouter value,
  // ) {}

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('lazy', lazy));
  }
}
