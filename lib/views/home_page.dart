import 'package:flutter/material.dart';
import 'package:pokedex/widgets/app_title.dart';
import 'package:pokedex/widgets/pokemon_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: OrientationBuilder( // Sayfanın ekran boyut değişimine build olarak ayak uydurabilmesi gerekli
          builder: (context, orientation) => const Column(
            children: [
              AppTitle(),
              Expanded( // Expanded kullanmamızın sebebi Column için sınırları belirlemek. Yoksa Column sonsuz uzunlukta olduğu için hata veriyor.
                child: PokemonList()),
            ],
          ),
        )
      ),
    );
  }
}

/* Buradaki kodlamalar sırasıyla

1. Etap İçin

İnternetten veri çekeceğimiz FutureBuilder widgetını kullanıyoruz. 
Alacağımız bilgiyi build içinde sürekli yenilemelerde değişip uygulamayı yormaması için dışarda initState içinde aldık.
FutureBuilder için future propertysine services kısmında hazırladığımız getPokemonData methodunu atadık.
itembuilder snapshot ile gelen veriyi tanımladık. İf else döngüsüyle durum kontrolü yaptık.
hasData kısmında data ile bilgileri aldık ve gerekli kısmını kullanarak ListView.builder ve ListTile ile ekrana yazdırdık.
Veritabanı işlemlerini ayrı bir yerden yönetmek için FutureBuilder widgetını extract ederek ayrı bir yere taşıyoruz.
Son olarak state durumu bu sayfada kalmadığı için stateless widget olarak güncelliyoruz.

2. Etap İçin

*/