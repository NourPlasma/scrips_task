import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core_events.dart';
import 'core_states.dart';

class CoreBloc extends Bloc<CoreEvents, CoreStates> {
  Locale currentLocal = Locale('en');

  CoreBloc() : super(InitialCounterState()) {
    on<ChangeLocal>((event, emit) => _changeLocal(event, emit));
  }

  // static CoreBloc get(BuildContext context) => BlocProvider.of(context);

  Future<void> _changeLocal(ChangeLocal event, Emitter<CoreStates> emit) async {
    currentLocal = event.locale;
    emit(SuccessCounterState());
  }
}
