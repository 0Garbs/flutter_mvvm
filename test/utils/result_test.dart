import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Should test Ok Result', () {
    test('Should create a Ok Result', () {
      final result = Result.ok('Ok');

      expect((result as Ok).value, 'Ok');
    });

    test('Should create a Error Result', () {
      final result = Result.error(Exception('Something went wrong...'));

      expect((result as Error).error, isA<Exception>());
    });

    test('Should create a Ok Result with extension', () {
      final result = 'Ok'.ok();

      expect((result as Ok).value, 'Ok');
    });

    test('Should create a Error Result with extension', () {
      final result = Exception('Something went wrong...').error();

      expect((result as Error).error, isA<Exception>());
    });

    test('Should create a Ok Result with extension asOk', () {
      final result = 'Ok'.ok();

      expect(result.asOk.value, 'Ok');
    });

    test('Should create a Error Result with extension asError', () {
      final result = Exception('Something went wrong...').error();

      expect(result.asError.error, isA<Exception>());
    });
  });
}
