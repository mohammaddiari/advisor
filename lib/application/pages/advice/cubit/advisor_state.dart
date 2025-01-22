part of 'advisor_cubit.dart';

sealed class AdvisorCubitState extends Equatable {
  const AdvisorCubitState();

  @override
  List<Object?> get props => <Object?>[];
}

final class AdvisorInitial extends AdvisorCubitState {}

final class AdvisorStateLoading extends AdvisorCubitState {}

final class AdvisorStateLoaded extends AdvisorCubitState {
  const AdvisorStateLoaded({required this.advice});
  final String advice;

  @override
  List<Object?> get props => <Object?>[advice];
}

final class AdvisorStateError extends AdvisorCubitState {
  const AdvisorStateError({required this.message});
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
