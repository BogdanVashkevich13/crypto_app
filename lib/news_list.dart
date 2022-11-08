import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/News_Bloc/news_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsEmptyState) {
        return Text('no data');
      }
      if (state is NewsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsLoadedState) {
        return ListView.builder(
          itemCount: 20,
            itemBuilder: (context, item) => //Container(
             // color:index % 2 == 0 ? Colors.lightBlue[50] : Colors.lightBlue[50],
              ListTile(
                leading: Text('name:'),
                //title: Column(
                  //children: [
                    //Text(state.loadedNews[index].author),
                    //Text('${state.loadedNews[index].title}'),
                    //Text('${state.loadedNews[index].description}'),
                    //Text('${state.loadedNews[index].publishedAt}'),
                    //Text('${state.loadedNews[index].content}'),
                  //],
                //),
             // ),
            ),
        );
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
