import 'package:flutter/material.dart';

class settingsP extends StatefulWidget {
  const settingsP({super.key});

  @override
  State<settingsP> createState() => settingsPState();
}

class settingsPState extends State<settingsP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  'Configurer les paramètres de l\'application - Work in progress',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          Card(
            child: Text(
              'Param2 : Work in progress',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ); //fin body
  }
}
