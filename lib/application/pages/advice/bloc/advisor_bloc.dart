import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advisor_event.dart';
part 'advisor_state.dart';

class AdvisorBloc extends Bloc<AdvisorEvent, AdvisorState> {
  AdvisorBloc() : super(AdvisorInitial()) {
    on<AdviceRequestedEvent>((
      AdviceRequestedEvent event,
      Emitter<AdvisorState> emit,
    ) async {
      emit(AdvisorStateLoading());
      debugPrint('fake get advice triggered');
      await Future<void>.delayed(const Duration(seconds: 3));
      debugPrint('got advice');
      emit(AdvisorStateLoaded(advice: 'fake advice to test bloc'));
    });
  }
}
