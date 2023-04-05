import 'dart:async';

main() {
  StreamController _myStreamController = StreamController();

  void functionForStreamController() async {
    for (int i = 0; i < 5; i++) {
      if (i == 4) {
        _myStreamController.sink.addError('error');
      }
      await Future.delayed(Duration(seconds: 1));
      _myStreamController.sink.add(i + 1);
    }
    _myStreamController.close();
  }

  functionForStreamController();
  _myStreamController.stream.listen((event) {
    print(event);
  }, onDone: () {
    print('onDone');
  }, onError: (error) {
    print('hata oldu');
  }, cancelOnError: true);
}
