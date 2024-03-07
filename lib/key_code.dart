enum KeyCode {
  KEYCODE_HOME,
  KEYCODE_BACK,
  KEYCODE_VOLUME_UP,
  KEYCODE_VOLUME_DOWN,
  KEYCODE_POWER,
  KEYCODE_MENU,
  NULL,
  UNKNOW;

  static KeyCode fromInt(int? keyCode) {
    if (keyCode == null) {
      return NULL;
    }

    if (keyCode == 3) {
      return KEYCODE_HOME;
    }

    if (keyCode == 4) {
      return KEYCODE_BACK;
    }

    if (keyCode == 24) {
      return KEYCODE_VOLUME_UP;
    }

    if (keyCode == 25) {
      return KEYCODE_VOLUME_DOWN;
    }

    if (keyCode == 26) {
      return KEYCODE_POWER;
    }

    if (keyCode == 82) {
      return KEYCODE_MENU;
    }

    return UNKNOW;
  }
}