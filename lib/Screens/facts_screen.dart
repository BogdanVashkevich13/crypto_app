import 'package:crypto_app/Facts_Bloc/Facts_Bloc.dart';
import 'package:crypto_app/Facts_Bloc/Facts_State.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key? key}) : super(key: key);

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
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
    return BlocBuilder<FactsBloc, FactsState>(builder: (context, state) {
      if (state is FactsLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FactsLoadedState) {
        return ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: ExpandableNotifier(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: <Widget>[
                        // GestureDetector(
                        //   onTap: () => controller.toggle(),
                        //   child: Image.asset('images/Bitcoin.png'),
                        //),
                        const SizedBox(
                          height: 10,
                        ),
                        //Image.asset('${state.loadedNews[index].urlToImage}'),
                        ScrollOnExpand(
                          child: ExpandablePanel(
                            controller: controller,
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.arrow_drop_down,
                              collapseIcon: Icons.close,
                              //tapBodyToCollapse: true,
                              //tapBodyToExpand: true,
                            ),
                            builder: (_, collapsed, expanded) => Padding(
                              padding: const EdgeInsets.all(10).copyWith(top: 0),
                              child: Expandable(
                                expanded: expanded,
                                collapsed: collapsed,
                              ),
                            ),
                            header: Padding(
                              padding: const EdgeInsets.all(10).copyWith(top: 0),
                              child: Text(
                                state.loadedFacts[index].title,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            collapsed: Text(
                              'Title: ${state.loadedFacts[index].description}',
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            expanded: Text(
                              'Description: ${state.loadedFacts[index].description}',
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
      if (state is FactsErorState) {
        return const Center(
          child: Text('Error'),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
