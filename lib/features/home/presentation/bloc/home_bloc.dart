import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  bool isMenuOpened = false;
  bool isDoctors = true;
  bool isPractitionerSelected = false;
  double rangeStart = 0;
  double rangeEnd = 24;
  String availabilityFilter = 'All';
  String locationFilter = 'Office';
  String typeFilter = 'First time';
  String appointmentFilter = 'General';

  HomeBloc() : super(InitialCounterState()) {
    on<ToggleMenu>((event, emit) => _toggleMenu(emit));
    on<ToggleSearchFilter>((event, emit) => _toggleSearchFilter(emit, event));
    on<SelectPractitioner>((event, emit) => _selectPractitioner(emit));
    on<RemovePractitioner>((event, emit) => _removePractitioner(emit));
    on<UpdateRange>((event, emit) => _updateRange(emit,event));
    on<UpdateFilter>((event, emit) => _updateFilter(emit,event));
    on<UpdateAppointmentFilter>((event, emit) => _updateAppointmentFilter(emit,event));
  }

  static HomeBloc get(BuildContext context) => BlocProvider.of(context);

  _toggleMenu(Emitter<HomeStates> emit) {
    isMenuOpened = !isMenuOpened;
    emit(SuccessToggleMenu());
  }

  _toggleSearchFilter(Emitter<HomeStates> emit, ToggleSearchFilter event) {
    isDoctors = event.type == 'doctors' ? true : false;
    emit(SuccessToggleSearchFilter());
  }

  _selectPractitioner(Emitter<HomeStates> emit) {
    isPractitionerSelected = true;
    emit(SuccessSelectPractitioner());
  }

  _removePractitioner(Emitter<HomeStates> emit) {
    isPractitionerSelected = false;
    emit(SuccessRemovePractitioner());
  }

  _updateRange(Emitter<HomeStates> emit, UpdateRange event) {
    rangeStart = event.start;
    rangeEnd = event.end;
    emit(SuccessUpdateRange());
  }

  _updateFilter(Emitter<HomeStates> emit, UpdateFilter event) {
    availabilityFilter = event.availability;
    locationFilter = event.location;
    typeFilter = event.type;
    emit(SuccessUpdateFilter());
  }

  _updateAppointmentFilter(Emitter<HomeStates> emit, UpdateAppointmentFilter event) {
      appointmentFilter = event.filter;
      emit(SuccessUpdateAppointmentFilter());
  }
}
