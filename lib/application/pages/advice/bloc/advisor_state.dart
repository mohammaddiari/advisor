part of 'advisor_bloc.dart';

@immutable
sealed class AdvisorState {}

final class AdvisorInitial extends AdvisorState {}

final class AdvisorStateLoading extends AdvisorState {}

final class AdvisorStateLoaded extends AdvisorState {
  AdvisorStateLoaded({required this.advice});
  final String advice;
}

final class AdvisorStateError extends AdvisorState {
  AdvisorStateError({required this.message});
  final String message;
}
