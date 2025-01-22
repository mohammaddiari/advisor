part of 'advisor_bloc.dart';

@immutable
sealed class AdvisorEvent {}

class AdviceRequestedEvent extends AdvisorEvent {}
