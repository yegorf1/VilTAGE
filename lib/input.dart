part of viltage;

class Input {
  static HashMap<int, int> _keys = new HashMap<int, int>();
  static HashMap<int, bool> _pressedKeys = new HashMap<int, bool>();
  
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
  
  static bool isPressed(int keyCode) {
    if(!isHeld(keyCode)) {
      _pressedKeys.remove(keyCode);
      return false;
    }

    if(isHeld(keyCode) && !_pressedKeys.containsKey(keyCode)) {
      _pressedKeys[keyCode] = true;
      return true;
    } else return false;
  }
}