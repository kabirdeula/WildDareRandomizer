import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gateway_state.dart';

class GatewayCubit extends Cubit<GatewayState> {
  GatewayCubit() : super(GatewayState.initial());

  void appLoaded() {
    emit(state.copyWith(isLoading: false));
  }
}
