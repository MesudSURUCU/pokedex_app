import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/views/home_page.dart';
import 'package:pokedex/services/pokedex_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PokeApi.getPokemonData();
    return ScreenUtilInit( // Responsive özelliğini kullanabilmek için uygulamamıza bu özelliği tanıtıyoruz.
    designSize:const  Size(766, 1629), // Cihazımızın özelliklerini tanıttık.
    builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex', 
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme()
        ),
        home: const HomePage(),
      ),
    );
  }
}

// Api bulup inceleme, bir tane elemanı seçip app.quicktype.io ya gidip model sınıfını - nesnesini oluşturma, model klasörü altında dart dosyasına taşıma,
// seervices klasörü altında  api dosyası oluştruma ve içeriğini yazma
