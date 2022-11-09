import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/News_Bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsLoadedState) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('News Details'),
            backgroundColor: ColorsSet.deep_sky_blue,
          ),
          body: Card(
              elevation: 2,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Text'
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.radio,
                                size: 20,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Some Text'
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Colors.grey.shade500,
                                size: 20,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('SomeText'
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )
              )
          ),
        );
      }
      if (state is NewsErorState){
        return const Center(
          child: Text('Error'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

// Scaffold(
//   appBar: AppBar(
//   centerTitle: true,
//   title: Text('News Details'),
//   backgroundColor: ColorsSet.deep_sky_blue,
//   ),
//   body: Card(
//   elevation: 2,
//   child: Padding(
//   padding: const EdgeInsets.all(12.0),
//   child: Column(
//   children: [
//   SizedBox(
//   height: 10,
//   ),
//   Text('Text'
//   ),
//   SizedBox(
//   height: 8,
//   ),
//   Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//   Row(
//   children: [
//   Icon(
//   Icons.radio,
//   size: 20,
//   color: Colors.grey.shade500,
//   ),
//   SizedBox(
//   width: 8,
//   ),
//   Text('Some Text'
//   ),
//   ],
//   ),
//   SizedBox(
//   width: 10,
//   ),
//   Row(
//   children: [
//   Icon(
//   Icons.calendar_today,
//   color: Colors.grey.shade500,
//   size: 20,
//   ),
//   SizedBox(
//   width: 8,
//   ),
//   Text('SomeText'
//   )
//   ],
//   )
//   ],
//   ),
//   SizedBox(
//   height: 10,
//   ),
//   ],
//   )
//   )
//   ),
//   );