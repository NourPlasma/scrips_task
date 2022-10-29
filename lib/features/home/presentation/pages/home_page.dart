import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:scrips_task/features/home/presentation/widgets/side_menu.dart';

import '../bloc/home_states.dart';
import '../widgets/create_appointment.dart';
import '../widgets/practitioner.dart';
import '../widgets/practitioner_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: Scaffold(
          body: Row(
            children: [
              const SideMenu(),
              const CreateAppointment(),
              // Expanded(child: PractitionerProfile()),
              Expanded(child: BlocBuilder<HomeBloc, HomeStates>(
                builder: (context, state) {
                  var isPractitionerSelected = HomeBloc.get(context).isPractitionerSelected;
                  return isPractitionerSelected ? const PractitionerProfile(): const Practitioner();
                },
              )),
            ],
          ),
        ));
  }
}
