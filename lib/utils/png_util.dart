import 'package:flutter/material.dart';
import 'package:pokedex_estagio/r.dart';

class PngUtil {
  static Widget getPngType({required String name}) {
    switch (name) {
      case 'bug':
        return Image.asset(R.assetsBug);
      case 'dark':
        return Image.asset(R.assetsDark);
      case 'dragon':
        return Image.asset(R.assetsDragon);
      case 'electric':
        return Image.asset(R.assetsElectric);
      case 'fairy':
        return Image.asset(R.assetsFairy);
      case 'fighting':
        return Image.asset(R.assetsFighting);
      case 'fire':
        return Image.asset(R.assetsFire);
      case 'flying':
        return Image.asset(R.assetsFlying);
      case 'ghost':
        return Image.asset(R.assetsGhost);
      case 'grass':
        return Image.asset(R.assetsGrass);
      case 'ground':
        return Image.asset(R.assetsGround);
      case 'ice':
        return Image.asset(R.assetsIce);
      case 'normal':
        return Image.asset(R.assetsNormal);
      case 'poison':
        return Image.asset(R.assetsPoison);
      case 'psychic':
        return Image.asset(R.assetsPsychic);
      case 'rock':
        return Image.asset(R.assetsRock);
      case 'shadow':
        return Image.asset(R.assetsShadow);
      case 'steel':
        return Image.asset(R.assetsSteel);
      case 'unknown':
        return Image.asset(R.assetsUnknown);
      case 'water':
        return Image.asset(R.assetsWater);
      case 'warning':
        return Image.asset(R.assetsWarning);
      default:
        return Image.asset(R.assetsWarning);
    }
  }
}
