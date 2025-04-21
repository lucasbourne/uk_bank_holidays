library;

import 'package:collection/collection.dart';
import 'package:date_utils/date_utils.dart';
import 'package:uk_bank_holidays/data/enums/divisions.dart';
import 'package:uk_bank_holidays/data/models/holiday.dart';
import 'package:uk_bank_holidays/data/models/holiday_response.dart';
import 'package:uk_bank_holidays/services/http_client_service.dart';

class UkBankHolidays {
  UkBankHolidays();

  final _httpClientService = HttpClientService();

  Future<List<HolidayResponse>> getHolidays() async {
    final holidaysResponse = await _httpClientService.get('bank-holidays.json');

    final allResponses = <HolidayResponse>[];

    for (final division in Divisions.values) {
      allResponses.add(
        HolidayResponse.fromJson(holidaysResponse[division.handle]),
      );
    }

    return allResponses;
  }

  Future<bool> checkHolidayToday({
    Divisions division = Divisions.englandAndWales,
  }) => checkHolidayAtDate(DateTime.now(), division: division);

  Future<bool> checkHolidayAtDate(
    DateTime date, {
    Divisions division = Divisions.englandAndWales,
  }) async {
    final holiday = await getHoliday(date: date, division: division);

    return holiday != null;
  }

  Future<Holiday?> getHoliday({
    required DateTime date,
    Divisions division = Divisions.englandAndWales,
  }) async {
    final fetchedHolidays = await getHolidays();

    final holidays =
        fetchedHolidays
            .singleWhereOrNull((holiday) => holiday.division == division)
            ?.holidays;

    return holidays?.firstWhereOrNull(
      (holiday) => DateUtils.isSameDay(holiday.date!, date),
    );
  }
}
