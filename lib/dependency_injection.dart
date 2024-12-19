import 'core/utils/utils.dart';
import 'features/gateway/gateway.dart';

void dependencyInjection() {
  // * Cubit
  locator.registerFactory<GatewayCubit>(
    () => GatewayCubit(),
  );
}
