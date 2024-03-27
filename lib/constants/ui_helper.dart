import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double getAppTitleWidgetHeight(){
  return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw; 
  // Title Widgetının yüksekliğini dikey ve yatat konumda kullanıma göre ayarlamış olduk.
  }

  static EdgeInsets getDefaultPadding() {
    if(ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(12.h);
    } else {
      return EdgeInsets.all(8.w);
    }
  }
  
    static EdgeInsets getIconPadding() {
    if(ScreenUtil().orientation == Orientation.portrait) {
      return EdgeInsets.all(10.h);
    } else {
      return EdgeInsets.all(4.w);
    }
  }


  static double calculatePokeImageAndBallSize() {
    if(ScreenUtil().orientation == Orientation.portrait) {
      return 0.2.sw;
    } else {
      return 0.3.sh;
    }
  }

// Pokemon türüne göre  Card renginin belirlenmesi için yapılan Color Map ve Metod
  static final Map<String, Color> typeColorMap = {
    'Grass' : Colors.green,
    'Fire' : Colors.redAccent,
    'Water' : Colors.blue,
    'Electric' : Colors.yellow,
    'Rock' : Colors.grey,
    'Ground' : Colors.brown,
    'Bug' : Colors.lightGreenAccent.shade700,
    'Psychic' : Colors.indigo,
    'Fighting' : Colors.orange,
    'Ghost' : Colors.deepPurple,
    'Normal' : Colors.black26,
    'Poison' : Colors.deepPurpleAccent,
  };

  static Color getColorFromType(String type) {
    if(typeColorMap.containsKey(type)){
      return typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }


}

  // Bunları yapmamızın amacı dikey ve yatay kullanım esnasında farklı görünümleri doğru şekilde elde etmek için.