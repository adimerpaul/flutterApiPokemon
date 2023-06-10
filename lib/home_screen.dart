import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  var pokeApi = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  late List pokedex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      fectchPokemonData();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Column(
        children: [
          pokedex == null ?
          Center(child: CircularProgressIndicator()) :
          Expanded(
            child: Container(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4
                ),
                itemCount: pokedex.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Column(
                      children: [
                        Text(pokedex[index]['name']),
                        Container(
                          child: Image.network(pokedex[index]['img']),
                          width: 100,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
  void fectchPokemonData(){
    var url = Uri.https("raw.githubusercontent.com", "/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    http.get(url).then((res){
      if(res.statusCode == 200) {
        var decodedJsonData = jsonDecode(res.body);
        pokedex = decodedJsonData['pokemon'];
        // print(pokedex);
        setState(() {
        });
      }
    });
  }
}