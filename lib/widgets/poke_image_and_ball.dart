import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  const PokeImageAndBall({super.key, required this.pokemon});
final PokemonModel pokemon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.pokeballImageUrl, 
            width: UIHelper.calculatePokeImageAndBallSize(), 
            height: UIHelper.calculatePokeImageAndBallSize(),
            fit: BoxFit.fitHeight,),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.ac_unit),
               width: UIHelper.calculatePokeImageAndBallSize(), 
              height: UIHelper.calculatePokeImageAndBallSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>const CircularProgressIndicator(
                color: Colors.black
              ),),
          ),
        )
      ],
    );
  }
}

// İnternetten alınan imagelerin tekrar tekrar yüklenmemesi cache stroge e eklenmesi için
// Dart Add Dependency cached_network_image