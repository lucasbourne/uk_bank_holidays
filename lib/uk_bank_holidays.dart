library;

import 'package:uk_bank_holidays/data/enums/divisions.dart';
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
}
