import 'package:crypto_app/Coin_Bloc/coin_bloc.dart';
import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/Facts_Bloc/Facts_Bloc.dart';
import 'package:crypto_app/Facts_api/facts_repository.dart';
import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/Screens/coin_screen_table.dart';
import 'package:crypto_app/Screens/coins_screen.dart';
import 'package:crypto_app/Screens/facts_screen.dart';
import 'package:crypto_app/Screens/news_screen.dart';
import 'package:crypto_app/coin_api/coin_repository.dart';
import 'package:crypto_app/news_api/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
final factsRepository = FactsRepository();
final newsRepository = NewsRepository();
final coinRepository = CoinRepository();
class _HomePageState extends State<HomePage> {
  @override
  int _selectTab = 1;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsScreen(),
    //CoinScreenTable(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewsBloc(newsRepository),
        ),
        BlocProvider(
            create: (context) => FactsBloc(factsRepository),
        ),
        BlocProvider(
            create: (context) => CoinBloc(coinRepository),
        ),
      ],
      // BlocProvider(
      //   create: (context) => NewsBloc(newsRepository),
      child:  Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Crypto App',
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: ColorsSet.white,
                //fontStyle: FontStyle.italic,
                fontSize: 25,
                // fontWeight: FontWeight.w700,
              ),
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
