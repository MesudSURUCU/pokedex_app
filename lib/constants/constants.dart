import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constants {

  Constants._();  // Kimse bu sınıftan nesne üretemez. Kurucu metodunu gizli hale getirdik.

// ******** STRİNG **********
  static const String title = "Pokedex";
  static const String pokeballImageUrl = "assets/images/pokeball.png";

// ******* TextStyle ******* 
static TextStyle getTitleTextStyle () {
  return  TextStyle(color: Colors.white, fontSize: _calculateFontSize(50), fontWeight: FontWeight.bold);
}

static TextStyle getPokemonNameTextStyle () {
  return  TextStyle(color: Colors.white, fontSize: _calculateFontSize(30), fontWeight: FontWeight.bold);
}

static TextStyle getTypeChipTextStyle () {
  return  TextStyle(color: Colors.white, fontSize: _calculateFontSize(20));
}

// ******* Other ********
static _calculateFontSize(int size) {
  if(ScreenUtil().orientation == Orientation.portrait) {
    return size.sp; // Telefon gömülü yazılımda olan font size özelliğinin kullanımını ve ayarlanmasını açmamızı sağladı.
  } else {
    return (size*1.5).sp;
  }
}

static getPokeInfoLabelTextStyle() {
  return TextStyle(fontSize: _calculateFontSize(40), color: Colors.black, fontWeight: FontWeight.bold);
}

static getPokeInfoTextStyle() {
  return TextStyle(fontSize: _calculateFontSize(30), color: Colors.black);
}
}