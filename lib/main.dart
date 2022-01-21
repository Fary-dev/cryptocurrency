import 'package:flutter/material.dart';

import 'screens/home_csreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textSize = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(11, 12, 54, 1),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Color.fromARGB(11, 12, 54, 1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(11, 12, 54, 1),
        ),
        textTheme: textSize.copyWith(
            headline4: textSize.headline4!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline5: textSize.headline5!.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline6: textSize.headline6!.copyWith(
              color: Colors.white,
            ),
            subtitle1:
                textSize.subtitle1!.copyWith(color: Colors.white, fontSize: 13),
            subtitle2: textSize.subtitle2!.copyWith(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
            overline: textSize.overline!.copyWith(
              color: Colors.grey,
            )),
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
