import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/constants/ui_helper.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokeInformation extends StatelessWidget {
  const PokeInformation({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      // Normalde color özelliği Container'a veriliyor. Fakat burada decoration kullandığımız için direk içerisine yazıyoruz.
      child: Padding(
        padding: UIHelper.getIconPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildInformationRow('Name', pokemon.name),
            buildInformationRow('Height', pokemon.height),
            buildInformationRow('Weight', pokemon.weight),
            buildInformationRow('Spawn Time', pokemon.spawnTime),
            buildInformationRow('Weakness', pokemon.weaknesses),
            buildInformationRow('Pre Evolution', pokemon.prevEvolution),
            buildInformationRow('Next Evolution', pokemon.nextEvolution)
          ],
        ),
      ),
    );
  }

  buildInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Constants.getPokeInfoLabelTextStyle(),),
        if(value is List && value.isNotEmpty)
        Text(value.join(","), style: Constants.getPokeInfoTextStyle(),) // Listelerde elemanları yan yana yazmak için bu yapıyı kullanıyoruz.
        else if(value == null)
        Text("Not available",style: Constants.getPokeInfoTextStyle(),)
        else Text(value, style: Constants.getPokeInfoTextStyle(),)
      ],
    );
  }
}
