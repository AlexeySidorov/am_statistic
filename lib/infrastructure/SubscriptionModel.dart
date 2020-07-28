import 'dart:async';

class SubscriptionModel<T> {
  StreamController _streamController = new StreamController<T>();
  Stream<T> get subscribe => _streamController.stream;

  void publish(T value) {
    _streamController.add(T);
  }
}
