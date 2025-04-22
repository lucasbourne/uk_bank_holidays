library;

import 'package:collection/collection.dart';
import 'package:date_utils/date_utils.dart';
import 'package:uk_bank_holidays/data/enums/divisions.dart';
import 'package:uk_bank_holidays/data/models/holiday.dart';
import 'package:uk_bank_holidays/repos/holiday_repo.dart';

class UkBankHolidays {
  UkBankHolidays();
  final _holidayRepo = HolidayRepo();

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
    final fetchedHolidays = await _holidayRepo.getHolidays();

    final holidays =
        fetchedHolidays
            .singleWhereOrNull((holiday) => holiday.division == division)
            ?.holidays;

    return holidays?.firstWhereOrNull(
      (holiday) => DateUtils.isSameDay(holiday.date!, date),
    );
  }
}
