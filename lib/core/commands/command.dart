import 'package:flutter/material.dart';
import 'package:flutter_mvvm/core/result/result.dart';

//? Result 0  doesn't have input parameters
typedef CommandAction0<Output extends Object>
    = Future<Result<Output>> //* Output is equivalent to T (Generic)
        Function();

//? Result 1 have input parameters
typedef CommandAction1<Output extends Object, T extends Object>
    = Future<Result<Output>> Function(T);

abstract class Command<Output extends Object> extends ChangeNotifier {
  //? Verify if command is in execution
  bool _running = false;

  bool get running => _running;

  //? Represent our state => Ok or Error or Null
  Result<Output>? _result;

  Result<Output>? get result => _result;

  bool get completed =>
      _result is Ok; //? Verify if our state was generated with success

  bool get error => _result is Error; //? Verify if our state is an error

  Future<void> _execute(CommandAction0<Output> action) async {
    if (_running) return; //? Avoid the action to executed twice

    _running = true; //? Set our state to running
    _result = null; //? Set our state to null

    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}


class Command0<Output extends Object> extends Command<Output> {
  final CommandAction0<Output> action;
  Command0(this.action);

  Future<void> execute() async {
    await _execute(() => action());
  }
}
