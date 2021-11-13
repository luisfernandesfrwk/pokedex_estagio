import 'dart:ui';

class ColorsUtil {
  static final primaryYellow = getColorByHex('#FFCC00');
  static final appBackground = getColorByHex('#464646');
  static final textFieldBackground = getColorByHex('#262626');
  static final searchIcon = getColorByHex('#0073BC');
  //types
  static final electricType = getColorByHex('#EECC43');
  static final fireType = getColorByHex('#E96161');
  static final grassType = getColorByHex('#82BE41');
  static final savageType = getColorByHex('#D86D4C');
  static final normalType = getColorByHex('#A5A5A5');
  static final psychicType = getColorByHex('#9D5C7F');
  static final flyingType = getColorByHex('#926032');
  static final rockType = getColorByHex('#7D7B7A');
  static final fightingType = getColorByHex('#5D87A1');
  static final bugType = getColorByHex('#3B9950');
  static final darkType = getColorByHex('#5A5979');
  static final dragonType = getColorByHex('#61CAD9');
  static final fairyType = getColorByHex('#EA1369');
  static final ghostType = getColorByHex('#9400C8');
  static final groundType = getColorByHex('#6E491E');
  static final iceType = getColorByHex('#D8F0FA');
  static final poisonType = getColorByHex('#9B69D9');
  static final steelType = getColorByHex('#5F756D');
  static final waterType = getColorByHex('#0073BC');
  static final unknowmType = getColorByHex('#1C9C88');
  static final shadowType = getColorByHex('#5D466E');

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
