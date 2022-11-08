import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/Screens/coins_screen.dart';
import 'package:crypto_app/Screens/facts_screen.dart';
import 'package:crypto_app/Screens/news_screen.dart';
import 'package:crypto_app/news_api/news_repository.dart';
import 'package:crypto_app/news_list.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
final newsRepository = NewsRepository();
class _HomePageState extends State<HomePage> {
  @override
  int _selectTab = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsScreen(),
    CoinsScreen(),
    FactsScreen(),
  ];

  void onSelectTab(int index){
    if (_selectTab == index) return;
    setState(() {
      _selectTab = index;
    });
  }

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NewsBloc(newsRepository),
      child:  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Crypto coins',
            style: TextStyle(
              color: ColorsSet.white,
            ),
          ),
        ),
        body: Center(child: _widgetOptions[_selectTab],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectTab,
          items:const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(CryptoFontIcons.BTC),
              label: 'Coins',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_sharp),
              label: 'Facts',
            ),
          ],
          onTap: onSelectTab,
        ),
      ),
    );

  }
}
