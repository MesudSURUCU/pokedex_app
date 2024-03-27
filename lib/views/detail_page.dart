import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/widgets/poke_information.dart';
import 'package:pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? buildPortraitBody(context)
        : buildLandscapeBody(context);
  }

  Scaffold buildLandscapeBody(BuildContext context) {
    return Scaffold(
        backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: UIHelper.getIconPadding(),
                child: IconButton(
                    iconSize: 35.w, // .r Genişlik ve yüksekliğe bakıyor. Hangisi küçükse ona göre oranlama yapıyor.
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        PokeNameType(
                          pokemon: pokemon,
                        ),
                        Expanded(
                          child: Hero(
                              tag: pokemon.id!,
                              child: CachedNetworkImage(
                                imageUrl: pokemon.img ?? "",
                                height: 0.25.sw,
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                      ]),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefaultPadding(),
                        child: PokeInformation(pokemon: pokemon),
                      ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Scaffold buildPortraitBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: UIHelper.getIconPadding(),
            child: IconButton(
                iconSize: 45
                    .w, // .r Genişlik ve yüksekliğe bakıyor. Hangisi küçükse ona göre oranlama yapıyor.
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          PokeNameType(
            pokemon: pokemon,
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 50,
                child: Image.asset(
                  Constants.pokeballImageUrl,
                  height: 0.15.sh,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.20.sh,
                  child: PokeInformation(pokemon: pokemon)),
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? "",
                      height: 0.30.sh,
                      fit: BoxFit.fitHeight,
                    )),
              )
            ],
          ))
        ],
      )),
    );
  }
}
