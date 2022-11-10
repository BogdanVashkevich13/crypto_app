import 'package:bloc/bloc.dart';
import 'package:crypto_app/Coin_Bloc/currencies_event.dart';
import 'package:crypto_app/Coin_Bloc/currencies_state.dart';
import 'package:crypto_app/coin_api/currency.dart';
import '../coin_api/coin_repository.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState>{
  final CoinRepository coinRepository;
  CoinBloc(this.coinRepository): super(CoinLoadingState()){
    _loadCoins();
    on<CoinLoadEvent>((event, emit) async {
      emit(CoinLoadingState());
      _loadCoins();
    });
  }
  Future<void> _loadCoins() async {
    try{
      final List<Coins> loadedCoinList = await coinRepository.getAllCoins();
      emit(CoinLoadedState(loadedCoin: loadedCoinList));
    } catch (_){
      emit(CoinErorState());
    }
  }
}