import 'dart:core';

import 'package:uk_bank_holidays/data/enums/divisions.dart';
import 'package:uk_bank_holidays/data/models/holiday.dart';

class HolidayResponse {
  const HolidayResponse({required this.division, required this.holidays});

  final Divisions division;
  final List<Holiday> holidays;

  factory HolidayResponse.fromJson(Map<String, dynamic> json) {
    return HolidayResponse(
      division: Divisions.fromHandle(json['division']),
      holidays:
          (json['events'] as List)
              .map((eventJson) => Holiday.fromJson(eventJson))
              .toList(),
    );
  }
}
