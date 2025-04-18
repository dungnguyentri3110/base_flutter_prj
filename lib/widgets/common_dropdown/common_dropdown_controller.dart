import 'dart:async';

class CommonDropdownController<T> {
  final StreamController<T> _controller = StreamController();
  Stream<T> get stream => _controller.stream;

  void setValue(){
    
  }
  

}
