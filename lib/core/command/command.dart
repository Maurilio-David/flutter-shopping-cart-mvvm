import 'package:desafio_tenda/core/result/result.dart';
import 'package:flutter/foundation.dart';

enum CommandStatus { idle, running, success, error }

class Command<T> extends ChangeNotifier {
  CommandStatus status = CommandStatus.idle;
  T? data;
  String? error;

  bool get isRunning => status == CommandStatus.running;
  bool get hasError => status == CommandStatus.error;
  bool get isSuccess => status == CommandStatus.success;

  Future<void> execute(Future<Result<T>> Function() action) async {
    status = CommandStatus.running;
    error = null;
    notifyListeners();

    final result = await action();

    if (result is Success<T>) {
      data = result.value;
      status = CommandStatus.success;
    } else if (result is Failure<T>) {
      error = result.message;
      status = CommandStatus.error;
    }

    notifyListeners();
  }

  void reset() {
    status = CommandStatus.idle;
    data = null;
    error = null;
    notifyListeners();
  }
}
