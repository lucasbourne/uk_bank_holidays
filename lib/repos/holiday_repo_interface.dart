import 'package:uk_bank_holidays/data/models/holiday_response.dart';

abstract class HolidayRepoInterface {
  Future<List<HolidayResponse>> getHolidays();
  void clearHolidays();
}
