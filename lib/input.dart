library input;
import 'dart:collection';
import 'dart:html';

class Input {
  static HashMap<int, int> _keys = new HashMap<int, int>();

  static init() {
    window.onKeyDown.listen((KeyboardEvent e) {
      if (!_keys.containsKey(e.keyCode))
        _keys[e.keyCode] = e.timeStamp;
    });

    window.onKeyUp.listen((KeyboardEvent e) {
      _keys.remove(e.keyCode);
    });
  }

  static bool isHeld(int keyCode) => _keys.containsKey(keyCode);
}