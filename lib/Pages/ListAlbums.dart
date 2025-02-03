import 'package:flutter/material.dart';
import '../Album/album.dart';

class listAlbumP extends StatefulWidget {
  const listAlbumP({super.key});

  @override
  State<listAlbumP> createState() => _listAlbumPState();
}

class _listAlbumPState extends State<listAlbumP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                children: <Widget>[
                  Album(
                      nomAlbum: "Metallica",
                      description:
                          "L'album marque une évolution importante dans le style du groupe. Les tempos sont plus lents, les morceaux plus courts et leurs structures beaucoup plus simples, aspirant ainsi à du simple rock.",
                      nomGroupe: "Metallica",
                      image: "Metallica.jpg"),
                ],
              ),
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                children: <Widget>[
                  Album(
                      nomAlbum: "And justice for all",
                      description:
                          "Description pour l'album 'And justice for all' de Metallica",
                      nomGroupe: "Metallica",
                      image: "And justice for all.jpg"),
                ],
              ),
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                children: <Widget>[
                  Album(
                      nomAlbum: "Hardwired",
                      description:
                          "Description pour l'album 'Hardwired' de Metallica",
                      nomGroupe: "Metallica",
                      image: "Hardwired.jpg"),
                ],
              ),
            ),
          )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
                children: <Widget>[
                  Album(
                      nomAlbum: "Kill'em all",
                      description:
                          "Description pour l'album 'Kill'em all' de Metallica",
                      nomGroupe: "Metallica",
                      image: "Kill'em all.jpg"),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
