import 'package:flutter/material.dart';
import 'package:gestionalbums/AppBar/custom_icons_icons.dart';
import 'package:gestionalbums/Pages/ListAlbums.dart';
import 'package:gestionalbums/Pages/Settings.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'AppBar/appbar.dart';
import 'Pages/Home.dart';
import 'Theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

//définition des thèmes et thème sombre
  final themeStr =
      await rootBundle.loadString('assets/appainter_theme_light.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  final themeStr_dark =
      await rootBundle.loadString('assets/appainter_theme_dark.json');
  final themeJson_dark = jsonDecode(themeStr_dark);
  final theme_dark = ThemeDecoder.decodeThemeData(themeJson_dark)!;

  runApp(MyApp(
    theme: theme,
    theme_dark: theme_dark,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  final ThemeData theme_dark;
  const MyApp({Key? key, required this.theme, required this.theme_dark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeController,
        builder: (context, themeMode, _) {
          return MaterialApp(
            title: 'Gestion d\'albums',
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: theme_dark,
            themeMode: themeMode,
            home: const MyHomePage(title: 'Gestion d\'albums Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  int currentPageIndex = 0;

  /*void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar_Principal(
          title: 'Gestion des albums',
          backgroundColor: Theme.of(context).colorScheme.primary,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.lightbulb),
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
          ]),
      body: <Widget>[
        // Page Home
        Container(
          child: homeP(),
        ),
        // Page Liste Albums
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: listAlbumP(),
        ),
        // Page Paramètres
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: settingsP(),
        ),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(CustomIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CustomIcons.queue_music),
            label: "Liste Albums",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(CustomIcons.cog_alt),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}
