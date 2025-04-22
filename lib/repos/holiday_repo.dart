import 'package:uk_bank_holidays/data/enums/divisions.dart';
import 'package:uk_bank_holidays/data/models/holiday_response.dart';
import 'package:uk_bank_holidays/repos/holiday_repo_interface.dart';
import 'package:uk_bank_holidays/services/http_client_service.dart';

class HolidayRepo implements HolidayRepoInterface {
  final _httpClientService = HttpClientService();
  final _holidays = <HolidayResponse>[];

  @override
  Future<List<HolidayResponse>> getHolidays() async {
    if (_holidays.isNotEmpty) {
      return Future.value(_holidays);
    }

    final holidaysResponse = await _httpClientService.get('bank-holidays.json');

    for (final division in Divisions.values) {
      _holidays.add(
        HolidayResponse.fromJson(holidaysResponse[division.handle]),
      );
    }

    return _holidays;
  }

  @override
  void clearHolidays() {
    _holidays.clear();
  }
}
