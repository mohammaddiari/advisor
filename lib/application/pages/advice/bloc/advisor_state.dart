part of 'advisor_bloc.dart';

@immutable
sealed class AdvisorState extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

final class AdvisorInitial extends AdvisorState {}

final class AdvisorStateLoading extends AdvisorState {}

final class AdvisorStateLoaded extends AdvisorState {
  AdvisorStateLoaded({required this.advice});
  final String advice;

  @override
  List<Object?> get props => <Object?>[advice];
}

final class AdvisorStateError extends AdvisorState {
  AdvisorStateError({required this.message});
  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}
