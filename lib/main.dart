import 'package:crypto_app/Colors/colors.dart';
import 'package:flutter/material.dart';

import 'Pages/home_page.dart';


void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CryptoCurrencies',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorsSet.deep_sky_blue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: ColorsSet.deep_sky_blue,
            selectedItemColor: ColorsSet.white,
            unselectedItemColor: ColorsSet.light_state_gray,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/':(BuildContext context) => HomePage(),
          //'/HomePage': (BuildContext context) => HomePage(),
        }
    );
  }
}
