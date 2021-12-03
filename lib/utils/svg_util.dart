import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projeto_estagio/r.dart';

class SvgUtil {
  static Widget getSvgType({required String name}) {
    switch (name) {
      case 'bug':
        return SvgPicture.asset(R.assetsBug);
      case 'dark':
        return SvgPicture.asset(R.assetsDark);
      case 'dragon':
        return SvgPicture.asset(R.assetsDragon);
      case 'electric':
        return SvgPicture.asset(R.assetsElectric);
      case 'fairy':
        return SvgPicture.asset(R.assetsFairy);
      case 'fighting':
        return SvgPicture.asset(R.assetsFighting);
      case 'fire':
        return SvgPicture.asset(R.assetsFire);
      case 'flying':
        return SvgPicture.asset(R.assetsFlying);
      case 'ghost':
        return SvgPicture.asset(R.assetsGhost);
      case 'grass':
        return SvgPicture.asset(R.assetsGrass);
      case 'ground':
        return SvgPicture.asset(R.assetsGround);
      case 'ice':
        return SvgPicture.asset(R.assetsIce);
      case 'normal':
        return SvgPicture.asset(R.assetsNormal);
      case 'poison':
        return SvgPicture.asset(R.assetsPoison);
      case 'psychic':
        return SvgPicture.asset(R.assetsPsychic);
      case 'rock':
        return SvgPicture.asset(R.assetsRock);
      case 'shadow':
        return SvgPicture.asset(R.assetsShadow);
      case 'steel':
        return SvgPicture.asset(R.assetsSteel);
      case 'unknown':
        return SvgPicture.asset(R.assetsUnknown);
      case 'water':
        return SvgPicture.asset('assets/water.svg');
      default:
        return SvgPicture.asset(R.assetsWarning);
    }
  }
}
