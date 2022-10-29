import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CoreEvents
{
  const CoreEvents();
}

class ChangeLocal extends CoreEvents {
  final Locale locale;
  ChangeLocal(this.locale);
}