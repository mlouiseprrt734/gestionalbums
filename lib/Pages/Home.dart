import 'package:flutter/material.dart';

class homeP extends StatefulWidget {
  const homeP({super.key});

  @override
  State<homeP> createState() => _homePState();
}

class _homePState extends State<homeP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset('img/imgAccueil/vinyl2.jpg',
                        width: 100, height: 100),
                  ),
                  Container(
                    child: Text(
                      'Bienvenue sur l\'application de gestion des albums',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'News: Dernières actualités',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Version 1 en cours de développement : Wait and see',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    ); //fin body
  }
}
