import 'package:uk_bank_holidays/uk_bank_holidays.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final ukBankHolidays = UkBankHolidays();

    test('getHolidays test', () async {
      final actual = await ukBankHolidays.getHolidays();

      expect(actual, isNotEmpty);
    });

    test('getHoliday test positive', () async {
      final actual = await ukBankHolidays.getHoliday(
        date: DateTime(DateTime.now().year, 12, 25),
      );

      expect(actual, isNotNull);
      expect(actual?.title, 'Christmas Day');
    });

    test('getHoliday test negative', () async {
      final actual = await ukBankHolidays.getHoliday(
        date: DateTime(DateTime.now().year, 12, 27),
      );

      expect(actual, isNull);
    });

    test('checkHolidayAtDate test positive', () async {
      final actual = await ukBankHolidays.checkHolidayAtDate(
        DateTime(DateTime.now().year, 12, 25),
      );

      expect(actual, true);
    });

    test('checkHolidayAtDate test negative', () async {
      final actual = await ukBankHolidays.checkHolidayAtDate(
        DateTime(DateTime.now().year, 12, 27),
      );

      expect(actual, false);
    });
  });
}
