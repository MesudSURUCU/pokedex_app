import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/services/pokedex_api.dart';
import 'package:pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi
        .getPokemonData(); // Bu şekilde sayfa ilk açıldığında veri gelecek sonra değişmeyecek.
    // Eğer build içinde yaparsak her defasında liste tekrar yüklenecekti.
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ScreenUtil().orientation == Orientation.portrait ? 2 : 3),
              itemCount: listem.length,
              itemBuilder: (context, index) {
                var oankiPokemon = listem[index];
                return PokeListItem(pokemon: oankiPokemon);
              });
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Hata Çıktı"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
