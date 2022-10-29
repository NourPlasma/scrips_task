// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create Appointment`
  String get createAppointment {
    return Intl.message(
      'Create Appointment',
      name: 'createAppointment',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Block Slot`
  String get blockSlot {
    return Intl.message(
      'Block Slot',
      name: 'blockSlot',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Walk In`
  String get walkIn {
    return Intl.message(
      'Walk In',
      name: 'walkIn',
      desc: '',
      args: [],
    );
  }

  /// `Practitioner`
  String get practitioner {
    return Intl.message(
      'Practitioner',
      name: 'practitioner',
      desc: '',
      args: [],
    );
  }

  /// `Profile, date & time`
  String get profileDateTime {
    return Intl.message(
      'Profile, date & time',
      name: 'profileDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Services & payment`
  String get servicesPayment {
    return Intl.message(
      'Services & payment',
      name: 'servicesPayment',
      desc: '',
      args: [],
    );
  }

  /// `Patient`
  String get patient {
    return Intl.message(
      'Patient',
      name: 'patient',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Co-Visit`
  String get coVisit {
    return Intl.message(
      'Co-Visit',
      name: 'coVisit',
      desc: '',
      args: [],
    );
  }

  /// `Soonest availability`
  String get soonestAvailability {
    return Intl.message(
      'Soonest availability',
      name: 'soonestAvailability',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `General Practice`
  String get generalPractice {
    return Intl.message(
      'General Practice',
      name: 'generalPractice',
      desc: '',
      args: [],
    );
  }

  /// `OB-GYN`
  String get oBGYN {
    return Intl.message(
      'OB-GYN',
      name: 'oBGYN',
      desc: '',
      args: [],
    );
  }

  /// `ENT`
  String get eNT {
    return Intl.message(
      'ENT',
      name: 'eNT',
      desc: '',
      args: [],
    );
  }

  /// `Physiotherapy`
  String get physiotherapy {
    return Intl.message(
      'Physiotherapy',
      name: 'physiotherapy',
      desc: '',
      args: [],
    );
  }

  /// `more`
  String get more {
    return Intl.message(
      'more',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Office`
  String get office {
    return Intl.message(
      'Office',
      name: 'office',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Virtual`
  String get virtual {
    return Intl.message(
      'Virtual',
      name: 'virtual',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `First time`
  String get firstTime {
    return Intl.message(
      'First time',
      name: 'firstTime',
      desc: '',
      args: [],
    );
  }

  /// `Follow Up`
  String get followUp {
    return Intl.message(
      'Follow Up',
      name: 'followUp',
      desc: '',
      args: [],
    );
  }

  /// `Practice`
  String get practice {
    return Intl.message(
      'Practice',
      name: 'practice',
      desc: '',
      args: [],
    );
  }

  /// `Show All`
  String get showAll {
    return Intl.message(
      'Show All',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `practitioners`
  String get practitioners {
    return Intl.message(
      'practitioners',
      name: 'practitioners',
      desc: '',
      args: [],
    );
  }

  /// `Doctors`
  String get doctors {
    return Intl.message(
      'Doctors',
      name: 'doctors',
      desc: '',
      args: [],
    );
  }

  /// `Nurses`
  String get nurses {
    return Intl.message(
      'Nurses',
      name: 'nurses',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `shifts`
  String get shifts {
    return Intl.message(
      'shifts',
      name: 'shifts',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Search for practitioners or specialties`
  String get searchHint {
    return Intl.message(
      'Search for practitioners or specialties',
      name: 'searchHint',
      desc: '',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message(
      'Dashboard',
      name: 'dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Calendar`
  String get calendar {
    return Intl.message(
      'Calendar',
      name: 'calendar',
      desc: '',
      args: [],
    );
  }

  /// `Clinical`
  String get clinical {
    return Intl.message(
      'Clinical',
      name: 'clinical',
      desc: '',
      args: [],
    );
  }

  /// `Patients`
  String get patients {
    return Intl.message(
      'Patients',
      name: 'patients',
      desc: '',
      args: [],
    );
  }

  /// `Billing`
  String get billing {
    return Intl.message(
      'Billing',
      name: 'billing',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
