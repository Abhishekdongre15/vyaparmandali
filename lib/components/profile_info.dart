import 'package:flutter/material.dart';
import 'package:uitoolkit/uitoolkit.dart';

class ProfileInfoView extends StatelessWidget {
   const ProfileInfoView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String data =
        'An artist of considerable range, Jenna the name taken by Melbourne-raised, Brooklyn-based Nick Murphy writes, performs and records all of his own music, giving it a warm, intimate feel with a solid groove structure. An artist of considerable range.';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// card header
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Spacer(flex: 1),
              // SocialValue('Friends', 22),
              // SocialValue('Photos', 10),
              // SocialValue('Comments', 86),
              const Spacer(flex: 10),
              UIToolkitButtons.primaryButton(
                text: 'Edit',
                onPressed: () {},
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Padding(padding: const EdgeInsets.all(20),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Shivam Pandey',
              style: ToolkitTypography.displayMedium
                  .copyWith(color: ToolkitColors.black)),
        ),),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.phone, size: 20, color: Colors.grey[400]),
            const SizedBox(width: 5),
            Text('9990009900',
                style: ToolkitTypography.body1A
                    .copyWith(color: ToolkitColors.greyDark)),
          ],
        ),
        const SizedBox(height: 30),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.email, size: 20, color: Colors.grey[400]),
            const SizedBox(width: 5),
            Text('Random123@gmail.com',
                style: ToolkitTypography.body1A
                    .copyWith(color: ToolkitColors.greyDark)),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.location_pin, size: 20, color: Colors.grey[400]),
            const SizedBox(width: 5),
            Text('Delhi - Ali vihar',
                style: ToolkitTypography.body1A
                    .copyWith(color: ToolkitColors.greyDark)),
          ],
        ),
        const SizedBox(height: 10),
        /// description
        Divider(height: 10, thickness: 1, color: Colors.grey[300]),
        Padding(padding: const EdgeInsets.all(20),
        child:       Text(data,
            style: ToolkitTypography.body1A
                .copyWith(color: ToolkitColors.greyDark)),),
        const SizedBox(height: 10),
        UIToolkitButtons.primaryButton(text: 'Show more', onPressed: () {})
      ],
    );
  }
  Widget socialValue(String label, int value) => Container(
        padding: const EdgeInsets.all(5),
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
