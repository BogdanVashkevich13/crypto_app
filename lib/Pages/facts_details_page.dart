import 'package:flutter/material.dart';

class FactsDetailsPage extends StatefulWidget {
  const FactsDetailsPage({Key? key}) : super(key: key);

  @override
  State<FactsDetailsPage> createState() => _FactsDetailsPageState();
}

class _FactsDetailsPageState extends State<FactsDetailsPage> {
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
                Text('Some Text'
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
                        Text('Some Text'
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
