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

  static Color getColorByType({required String type}) {
    switch (type) {
      case 'normal':
        return getColorByHex('#A5A5A5');
      case 'fire':
        return getColorByHex('#E96161');
      case 'electric':
        return getColorByHex('#EECC43');
      case 'grass':
        return getColorByHex('#82BE41');
      case 'savage':
        return getColorByHex('#D86D4C');
      case 'psychic':
        return getColorByHex('#9D5C7F');
      case 'flying':
        return getColorByHex('#926032');
      case 'rock':
        return getColorByHex('#7D7B7A');
      case 'fighting':
        return getColorByHex('#5D87A1');
      case 'bug':
        return getColorByHex('#3B9950');
      case 'dark':
        return getColorByHex('#5A5979');
      case 'dragon':
        return getColorByHex('#61CAD9');
      case 'fairy':
        return getColorByHex('#EA1369');
      case 'ghost':
        return getColorByHex('#9400C8');
      case 'ground':
        return getColorByHex('#6E491E');
      case 'ice':
        return getColorByHex('#D8F0FA');
      case 'poison':
        return getColorByHex('#9B69D9');
      case 'steel':
        return getColorByHex('#5F756D');
      case 'water':
        return getColorByHex('#0073BC');
      case 'unknowm':
        return getColorByHex('#1C9C88');
      case 'shadow':
        return getColorByHex('#5D466E');
      default:
        return ColorsUtil.appBackground;
    }
  }

  static Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
