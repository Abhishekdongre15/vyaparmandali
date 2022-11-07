import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/views/components/reusableText.dart';

class ProfileInFo extends StatelessWidget {
  String data =
      'An artist of considerable range, Jenna the name taken by Melbourne-raised, Brooklyn-based Nick Murphy writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. An artist of considerable range.';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// card header
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(flex: 1),
                // SocialValue('Friends', 22),
                // SocialValue('Photos', 10),
                // SocialValue('Comments', 86),
                Spacer(flex: 10),
                UIToolkitButtons.primaryButton(
                  text: 'Edit',
                  onPressed: () {},
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
          SizedBox(height: 50), LargeBoldTextBlack('Shivam Pandey'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              NormalGreyText('9990009900'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              NormalGreyText('Random123@gmail.com'),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              NormalGreyText('Delhi - Ali vihar'),
            ],
          ),
          /// description
          Divider(height: 30, thickness: 1, color: Colors.grey[300]),
          NormalGreyText(data),
          SizedBox(height: 10),
          UIToolkitButtons.primaryButton(text: 'Show more', onPressed: () {})
        ],
      ),
    );
  }
  Widget SocialValue(String label, int value) => Container(
        padding: EdgeInsets.all(5),
        height: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('$value',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            Text(
              label,
              style: TextStyle(
                  color: Colors.grey[900],
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
