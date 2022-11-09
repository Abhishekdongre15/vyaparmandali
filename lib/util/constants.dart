import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/widget/Entry.dart';
import 'package:vyaparmandali/views/profile_page_view.dart';

// Colors used in this app
const primaryColor = Color.fromRGBO(17, 159, 250, 1);
const secondaryColor = Colors.white;
const bgColor = Color.fromRGBO(247, 251, 254, 1);
const textColor = Colors.black;
const lightTextColor = Colors.black26;
const transparent = Colors.transparent;

const grey = Color.fromRGBO(148, 170, 220, 1);
const purple = Color.fromRGBO(165, 80, 179, 1);
const orange = Color.fromRGBO(251, 137, 13, 1);
const green = Color.fromRGBO(51, 173, 127, 1);
const red = Colors.red;

final List<Entry> data = <Entry>[
  Entry(
    'MASTER',
    <Entry>[
      Entry(
        'CODES',
        <Entry>[
          Entry('GROUP'),
          Entry('STD CODE'),
          Entry('NARRATION'),
        ],
      ),
      Entry(
        'ITEM',
        <Entry>[
          Entry('ITEM NAME'),
          Entry('ITEM EXP'),
          Entry('HAMALI EXP'),
        ],
      ),
      Entry('A/C MASTER'),
      Entry('PLACE MASTER'),
      Entry('A/C SETTINGS'),
      Entry('ACCOUNT MERGE'),
    ],
  ),
// Second Row
  Entry('DATA ENTERY', <Entry>[
    Entry('ROJMEL'),
    Entry('VACHHAT AVAK'),
    Entry('DHADA ENTRY'),
    Entry('BILL PROCESSING'),
    Entry('GROCCERY BOARD AVAK'),
    Entry('OCCATIONAL ENTRY', <Entry>[
      Entry('JOURNAL ENTRY'),
      Entry('PURCHASE ENTRY'),
    ]),
  ]),
];

// Default App Padding
const appPadding = 16.0;

TextStyle kLoginTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );

TextStyle kLoginSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );

TextStyle kLoginTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);

TextStyle kHaveAnAccountStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: size.height * 0.022, color: Colors.black);

TextStyle kLoginOrSignUpTextStyle(
  Size size,
) =>
    GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color:ToolkitColors.primary,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

var defaultBackgroundColor = Colors.grey[300];
var appBarColor =ToolkitColors.black;
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);


