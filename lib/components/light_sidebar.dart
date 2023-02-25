// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LightSidebar extends StatelessWidget {
  LightSidebar(
      {Key? key,
      required this.headName,
      required this.totalValue,
      this.iconName = Icons.photo})
      : super(key: key);
  String headName;
  String totalValue;
  IconData iconName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(headName),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      totalValue,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Icon(
                  iconName,
                  color: Colors.green,
                  size: 50,
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  '2.4+',
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  'From previous period',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
