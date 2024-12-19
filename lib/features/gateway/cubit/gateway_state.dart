part of 'gateway_cubit.dart';

class GatewayState extends Equatable {
  final bool isLoading;

  const GatewayState({
    this.isLoading = false,
  });

  factory GatewayState.initial() => const GatewayState();

  GatewayState copyWith({
    bool? isLoading,
  }) {
    return GatewayState(isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [isLoading];
}
