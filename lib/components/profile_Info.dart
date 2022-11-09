import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class ProfileInfoView extends StatelessWidget {
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
          SizedBox(height: 50),
          Text('Shivam Pandey',
              style: ToolkitTypography.displayMedium
                  .copyWith(color: ToolkitColors.black)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              Text('9990009900',
                  style: ToolkitTypography.body1A
                      .copyWith(color: ToolkitColors.greyDark)),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              Text('Random123@gmail.com',
                  style: ToolkitTypography.body1A
                      .copyWith(color: ToolkitColors.greyDark)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_pin, size: 20, color: Colors.grey[400]),
              SizedBox(width: 5),
              Text('Delhi - Ali vihar',
                  style: ToolkitTypography.body1A
                      .copyWith(color: ToolkitColors.greyDark)),
            ],
          ),

          /// description
          Divider(height: 30, thickness: 1, color: Colors.grey[300]),
          Text(data,
              style: ToolkitTypography.body1A
                  .copyWith(color: ToolkitColors.greyDark)),
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
