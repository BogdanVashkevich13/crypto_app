import 'package:crypto_app/News_Bloc/news_bloc.dart';
import 'package:crypto_app/News_Bloc/news_state.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
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

  // List<News> newsHeadlines = [];
  // bool loading = true;

  void _onNewsTab(int index) {
    Navigator.of(context).pushNamed('/news_details');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
      if (state is NewsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is NewsLoadedState) {
        return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ExpandableNotifier(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => controller.toggle(),
                            child: Image.network(
                                state.loadedNews[index].urlToImage)),
                        const SizedBox(
                          height: 10,
                        ),
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
                              padding:
                                  const EdgeInsets.all(10).copyWith(top: 0),
                              child: Expandable(
                                expanded: expanded,
                                collapsed: collapsed,
                              ),
                            ),
                            header: Padding(
                              padding:
                                  const EdgeInsets.all(10).copyWith(top: 0),
                              child: Text(
                                state.loadedNews[index].title,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            collapsed: Text(
                              'Author: ${state.loadedNews[index].author}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            expanded: Text(
                              'Description: ${state.loadedNews[index].description}',
                              softWrap: true,
                              style: const TextStyle(
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
            });
      }
      if (state is NewsErorState) {
        return const Center(
          child: Text('Error'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}

// ExpandablePanel(
// header: Text('Title: ${state.loadedNews[index].title}'),
// collapsed: Text(
// 'Author: ${state.loadedNews[index].author}'),
// expanded: Text(
// 'Description: ${state.loadedNews[index].description}'),
// ),
//
// Column(
// children: [
// Image.asset('${state.loadedNews[index].urlToImage}'),
//
// ],
// ),

// ListView.builder(
// itemCount: 50,
// itemBuilder: (BuildContext context, int index) {
// return Padding(
// padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
// child: GestureDetector(
// onTap: () => {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) =>
// const NewsDetailsPage(
// )),
// )
// },
// child:  Container(
// decoration: BoxDecoration(
// color: ColorsSet.white,
// borderRadius: const BorderRadius.all(Radius.circular(10)),
// border: Border.all(color: Colors.black12),
// boxShadow: const [
// BoxShadow(
// color: Colors.black12,
// blurRadius: 8,
// offset: Offset(0, 2),
// ),
// ],
// ),
// clipBehavior: Clip.hardEdge,
// child: Row(
// children: [
// Image.asset(
// 'images/Bitcoin.png',
// width: 120,
// height: 100,
// ),
// const SizedBox(
// width: 15,
// ),
// Expanded(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children:  [
// Text(
// 'Author: ${state.loadedNews[index].author}',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// style: TextStyle(fontWeight: FontWeight.bold),
// ),
// SizedBox(
// height: 5,
// ),
// Text(
// 'Title:${state.loadedNews[index].title}',
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// SizedBox(
// height: 5,
// ),
// Text(
// 'Description: ${state.loadedNews[index].description}',
// maxLines: 3,
// overflow: TextOverflow.ellipsis,
// ),
// ],
// ),
// ),
// const SizedBox(
// width: 5,
// ),
// ],
// ),
// ),
// )
// );
// });
