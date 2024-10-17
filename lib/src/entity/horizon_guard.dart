import 'package:flutter/widgets.dart';

typedef HGuardChecker = bool Function(BuildContext context, dynamic args);

typedef HFutureGuardChecker = Future<bool> Function(BuildContext context, dynamic args);

typedef HStreamGuardChecker = Stream<bool> Function(BuildContext context, dynamic args);

sealed class HGuard {
  final String redirectTo;

  const HGuard(this.redirectTo);
}

final class HorizonGuard extends HGuard {
  final HGuardChecker checker;

  const HorizonGuard({required String redirectTo, required this.checker}) : super(redirectTo);
}

final class FutureHorizonGuard extends HGuard {
  final HFutureGuardChecker checker;

  const FutureHorizonGuard({required String redirectTo, required this.checker}) : super(redirectTo);
}

final class StreamHorizonGuard extends HGuard {
  final HStreamGuardChecker checker;

  const StreamHorizonGuard({required String redirectTo, required this.checker}) : super(redirectTo);
}
