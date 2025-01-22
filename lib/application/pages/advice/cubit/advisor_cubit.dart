import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advisor_state.dart';

class AdvisorCubit extends Cubit<AdvisorCubitState> {
  AdvisorCubit() : super(AdvisorInitial());

  Future<void> adviceRequested() async {
    emit(AdvisorStateLoading());
    debugPrint('fake get advice triggered');
    await Future<void>.delayed(const Duration(seconds: 3));
    debugPrint('got advice');
    emit(const AdvisorStateLoaded(advice: 'fake advice to test bloc'));
  }
}
