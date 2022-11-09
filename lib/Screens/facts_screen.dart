import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/Facts_Bloc/Facts_Bloc.dart';
import 'package:crypto_app/Facts_Bloc/Facts_State.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key? key}) : super(key: key);

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactsBloc, FactsState>(builder: (context, state) {
      if (state is FactsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FactsLoadedState) {
        return ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: GestureDetector(
                    onTap: () {},
                    child:  Container(
                      decoration: BoxDecoration(
                        color: ColorsSet.white,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  const [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Title:',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Description:',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  )
              );
            });
      }
      if (state is FactsErorState){
        return const Center(
          child: Text('Error'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}



