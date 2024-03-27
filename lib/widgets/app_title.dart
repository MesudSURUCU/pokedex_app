import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({super.key});

  @override
  State<AppTitle> createState() => _AppTitleState();
}

class _AppTitleState extends State<AppTitle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: UIHelper.getAppTitleWidgetHeight(),
        child: Stack(
          // Yığın yapısı oluşturmak için kullanıyoruz.
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child:
                      Text(Constants.title, style: Constants.getTitleTextStyle())),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(Constants.pokeballImageUrl,
                  width: ScreenUtil().orientation == Orientation.portrait ? 0.2.sh : 0.2.sw,
                  fit: BoxFit
                      .fitWidth), // .w ve .h ile ekran özelliğine göre oranlama yapacak.
              // Artık değerler ekran boyutundan geldiği için tam kare bir yapı değilde değişken bir yapı oluşur. Kare yapı için her ikisini de aynı yerden okumak gerekir.
            ),
          ],
        ),
      ),
    );
  }
}

// Sadece widgetların yeri değiştiriliyorsa o zaman Align yeterli. Widgetların bir kısmının gözükmemesini istiyorsak Positioned kullanmamız lazım.