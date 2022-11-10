import 'package:crypto_app/Coin_Bloc/coin_bloc.dart';
import 'package:crypto_app/Coin_Bloc/currencies_state.dart';
import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/coin_api/coin_repository.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';


class CoinScreenTable extends StatefulWidget {
  const CoinScreenTable({Key? key}) : super(key: key);

  @override
  State<CoinScreenTable> createState() => _CoinScreenTableState();
}

class _CoinScreenTableState extends State<CoinScreenTable> {
  late ExpandableController controller;

  @override
  void initState() {
    super.initState();
    controller = ExpandableController();
  }
  @override
  void disponce() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return BlocBuilder<CoinBloc, CoinState>(
      builder: (context, state) {
        if (state is CoinLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CoinLoadedState) {
          return  ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Padding(padding: EdgeInsets.all(10),
                  child: ExpandableNotifier(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: <Widget> [
                          GestureDetector(
                            onTap: () => controller.toggle(),
                            child: Image.asset('images/Bitcoin.png'),
                          ),
                          const SizedBox(height: 10,),
                          //Image.asset('${state.loadedNews[index].urlToImage}'),
                          ScrollOnExpand(
                            child: ExpandablePanel(
                              controller: controller,
                              theme: const ExpandableThemeData(
                                expandIcon: Icons.arrow_drop_down,
                                collapseIcon: Icons.close,
                                tapBodyToCollapse: true,
                                tapBodyToExpand: true,
                              ),
                              builder: (_, collapsed, expanded) => Padding(
                                padding: const EdgeInsets.all(10).copyWith(top: 0),
                                child: Expandable(
                                  expanded: expanded,
                                  collapsed: collapsed ,
                                ),
                              ),
                              header: Padding(padding: const EdgeInsets.all(10).copyWith(top: 0),
                                child: Text('Title: ${state.loadedCoin[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              collapsed: Text(
                                'Author: ${state.loadedCoin[index].id}',
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              expanded: Text(
                                'Description: ${state.loadedCoin[index].oneHourChange}',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
        if (state is CoinErorState){
          return const Center(
            child: Text('Error'),
          );
        }
        return const SizedBox.shrink();
      });
}
}
