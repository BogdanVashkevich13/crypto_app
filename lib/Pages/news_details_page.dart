import 'package:flutter/material.dart';
class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

