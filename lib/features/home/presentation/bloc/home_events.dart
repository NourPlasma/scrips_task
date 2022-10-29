import 'package:flutter/foundation.dart';

@immutable
abstract class HomeEvents
{
  const HomeEvents();
}


class ToggleMenu extends HomeEvents{

}

class ToggleSearchFilter extends HomeEvents{
    final String type;
    const ToggleSearchFilter(this.type);
}

class SelectPractitioner extends HomeEvents{}

class UpdateRange extends HomeEvents{
  final double start;
  final double end;
  const UpdateRange(this.start,this.end);
}

class UpdateFilter extends HomeEvents{
  final String location;
  final String availability;
  final String type;
  const UpdateFilter(this.location,this.availability,this.type);
}

class UpdateAppointmentFilter extends HomeEvents{
  final String filter;
  const UpdateAppointmentFilter(this.filter);
}

class RemovePractitioner extends HomeEvents{}