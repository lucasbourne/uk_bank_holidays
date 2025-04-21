import 'package:uk_bank_holidays/uk_bank_holidays.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final ukBankHolidays = UkBankHolidays();

    test('getHolidays test', () async {
      final actual = await ukBankHolidays.getHolidays();

      expect(actual, isNotEmpty);
    });
  });
}
