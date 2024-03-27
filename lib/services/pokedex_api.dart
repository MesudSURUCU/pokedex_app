import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeApi {
  static const String _url ='https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'; 
  // Sonunda .json olduğu için bize sanki text dosyası gibi geliyor. Bu yüzden ilk olarak json decode yaparak json dosyası haline getiriyoruz.

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> list = [];
    
   var result = await Dio().get(_url); // Şu anda result değişken türü Response<dynamic>. Gelen veri String türünde geliyor.
   var pokeList = jsonDecode(result.data)['pokemon']; // Şu anda pokeList değişken türü dynamic. Gelen veri ilk kodlamayla Json türünde ikinci alanla liste türünde geliyor.
   debugPrint(pokeList.toString()); // Şu anda bütün pokemonların olduğu bir listeyi bu kodla almış olduk.
   // Şimdi bu listeyi kendi modellerimize dönüştüreceğiz.

   if(pokeList is List) { // Bu kodlamanın sebebi dynamic değişken türünü List'e çevirmek.
    list = pokeList.map((e) => PokemonModel.fromJson(e)).toList(); 
    // İlk önce pokeList'in içindeki her bir elemanı Map'liyoruz. Daha sonra PokeModel.fromJson fonksiyonuna bu verileri yolluyoruz.
    // Bu verileri de son olarak Liste haline çevirip _list'e tanımlıyoruz. 
   }

   debugPrint(list.length.toString());
   debugPrint(list.first.toString()); // Pokemon Modelde toString metodu oluşturarak bu bilgiyi alabildik.

    return list;
  }
}

/* Buradaki kodlamalar sırasıyla;

ilk olarak _list adında PokemonModel elemanları tutan boş bir liste tanımladım.
Dio kütüphanesiyle apileri alacağım url'e ulaştım ve bunu result değişkenine atadım. Değişken türünün String olduğunu gördüm.
Zaman alacak bir işlem olduğu için bunu yaparken await kullandım. Metoda async özelliğini tanıttım ve Future metodunu kullanıp dönüş değerini tanımladım.
result.data ile gelen bilginin içeriğine baktım. Bir Map olduğunu gördüm. Bunun pokemen keyi ile value kısmına ulaşıp pokeList değişkeni içine atadım.
Artık benim dışardan alma işlemim tamamlanmış oldu.
value kısmının da bir liste şeklinde döndüğünü gördüğüm için dynamic değişken türünü List şeklinde tanıttım. (poekList is List).
Bu aşamadan sonra PokeModel sınıfının metodunu kullanabilmek için işlemlere başladım.
pokeList içerisini map yaparak PokemonModel.fromJson fonksiyonu içine atadım. En sonra listeye çevirerek _list içine atadım.


*/
