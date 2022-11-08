import 'package:crypto_app/Colors/colors.dart';
import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/News_Bloc/news_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  void _onNewsTab (int index) {
    //final title = _news[index].title;
    Navigator.of(context).pushNamed('/news_details');
    //arguments: title,
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsLoadedState) {
        return ListView.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: GestureDetector(
                    onTap: () =>  _onNewsTab(index),
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
                          Image.asset(
                            'images/Bitcoin.png',
                            width: 120,
                            height: 100,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  'Author: ${state.loadedNews[index].author}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Title:${state.loadedNews[index].title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Description: ${state.loadedNews[index].description}',
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
      if (state is NewsErorState){
        return const Center(
          child: Text('Eror'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

