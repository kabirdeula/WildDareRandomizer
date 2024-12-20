import 'core/utils/utils.dart';
import 'features/dashboard/dashboard.dart';
import 'features/gateway/gateway.dart';

void dependencyInjection() {
  // * Cubit
  locator.registerFactory<GatewayCubit>(
    () => GatewayCubit(),
  );

  locator.registerFactory<DashboardCubit>(
    () => DashboardCubit(),
  );
}
