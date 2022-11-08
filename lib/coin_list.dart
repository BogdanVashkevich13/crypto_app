import 'package:crypto_app/Coin_Bloc/coin_bloc.dart';
import 'package:crypto_app/Coin_Bloc/currencies_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinList extends StatelessWidget {
  const CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinBloc, CoinState>(
      builder: (context, state) {
        // if (state is CoinEmptyState) {
        //   return Text('no data');
        // }
        if (state is CoinLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CoinLoadedState) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.red : Colors.lightBlue[50],
              child: ListTile(
                leading: Text(state.loadedCoin[index].name),
                title: Column(
                  children: [
                    Text(state.loadedCoin[index].name),
                    // Column(
                    //   children: [Text('${state.loadedCoin[index].price}')],
                    // ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is CoinErorState) {
          return const Center(
            child: Text('Eror'),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
