import 'package:flutter/material.dart';
import 'package:gestionalbums/AppBar/custom_icons_icons.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'AppBar/appbar.dart';

//controller pour le thème
class ThemeController extends ValueNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.light);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeController = ThemeController();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  int _counter = 0;
  int currentPageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                ThemeController().toggleTheme();
              },
            ),
          ]),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Image.asset('img/imgAccueil/vinyl2.jpg',
                        width: 100, height: 100),
                    Text(
                      'Bienvenue sur l\'application de gestion des albums',
                      style: TextStyle(fontSize: 16),
                    ),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: const Icon(CustomIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: const Icon(CustomIcons.queue_music),
            label: "Liste Albums",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: const Icon(CustomIcons.cog_alt),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}
