import 'package:crypto_app/Colors/colors.dart';
import 'package:flutter/material.dart';

class FactsScreen extends StatefulWidget {
  const FactsScreen({Key? key}) : super(key: key);

  @override
  State<FactsScreen> createState() => _FactsScreenState();
}

class _FactsScreenState extends State<FactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: ColorsSet.mint,);
  }
}
