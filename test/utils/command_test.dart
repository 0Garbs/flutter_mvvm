import 'package:flutter_mvvm/utils/commands/command.dart';
import 'package:flutter_mvvm/utils/result/result.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Shoud teste Commands', () {
    test('Should test Command0 returning OK', () async {
      //? Arrange
      final command0 = Command0<String>(getOKResult);

      expect(command0.completed, false);
      expect(command0.error, false);
      expect(command0.running, false);
      expect(command0.result, isNull);

      //! Act
      await command0.execute();

      //* Assert
      expect(command0.completed, true);
      expect(command0.error, false);
      expect(command0.running, false);
      expect(command0.result, isNotNull);
      expect((command0.result as Ok).value, 'Everything went well');
    });

    test('Should teste Command0 returning Error', () async {
      //? Arrange
      final command0 = Command0<bool>(getErrorResult);

      expect(command0.completed, false);
      expect(command0.error, false);
      expect(command0.running, false);
      expect(command0.result, isNull);

      //! Act
      await command0.execute();

      //* Assert
      expect(command0.completed, false); //? Did not ended the action
      expect(command0.error, true);
      expect(command0.running, false);

      expect(command0.result, isNotNull);
      expect(command0.result?.asError.error, isA<Exception>());
    });

    test('Should test Command1 returning Ok', () async {
      //? Arrange
      final command1 = Command1<String, String>(getOKResult1);

      expect(command1.completed, false);
      expect(command1.error, false);
      expect(command1.running, false);
      expect(command1.result, isNull);

      //! Act
      await command1.execute('Input parameter');

      //* Assert
      expect(command1.completed, true);
      expect(command1.error, false);
      expect(command1.running, false);

      expect(command1.result, isNotNull);
      expect((command1.result as Ok).value, 'Input parameter');
    });

    test('Should test Command1 returning Error', () async {
      //? Arrange
      final command1 = Command1<bool, String>(getErrorResult1);

      expect(command1.completed, false);
      expect(command1.error, false);
      expect(command1.running, false);
      expect(command1.result, isNull);

      //! Act
      await command1.execute('Input parameter');

      //* Assert
      expect(command1.completed, false);
      expect(command1.error, true);
      expect(command1.running, false);

      expect(command1.result, isNotNull);
      expect((command1.result as Error).error, isA<Exception>());
    });
  });
}

Future<Result<String>> getOKResult() async {
  await Future.delayed(const Duration(seconds: 1));
  return Result.ok('Everything went well');
}

Future<Result<bool>> getErrorResult() async {
  await Future.delayed(const Duration(seconds: 1));
  return Result.error(Exception('Something went wrong...'));
}

Future<Result<String>> getOKResult1(String param) async {
  await Future.delayed(const Duration(seconds: 1));
  return Result.ok(param);
}

Future<Result<bool>> getErrorResult1(String param) async {
  await Future.delayed(const Duration(seconds: 1));
  return Result.error(Exception('Something went wrong...'));
}
