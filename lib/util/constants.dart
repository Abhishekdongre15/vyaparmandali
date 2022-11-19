import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uitoolkit/uitoolkit.dart';
import 'package:vyaparmandali/widget/Entry.dart';

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
    Entry('NEFT/RTGS'),
    Entry('OCCATIONAL ENTRY', <Entry>[
      Entry('JOURNAL ENTRY'),
      Entry('PURCHASE ENTRY'),
    ]),
  ]),

  // Third Row
  Entry('REPORT', <Entry>[
    Entry('CASH/BANK BOOK', <Entry>[
      Entry('ROJMEL AS A/C'),
      Entry('ROJMEL AS BOOK'),
      Entry('CASH BOOOK'),
      Entry('BANK BOOK'),
      Entry('DAILY CASH BALANCE'),
      Entry('DAY WISE BANK BOOK'),
      Entry('BANK RECO'),
      Entry('CASH LIMITS REPORT'),
    ]),
    Entry('VACHHAT REPORT', <Entry>[
      Entry('PATTI REGISTER'),
      Entry('VACHHAT PATTI O/S'),
      Entry('JAMA NONDH'),
      Entry('JAMA NONDH SUMMERY'),
      Entry('JAMA NONDH SUMMERY MONTHLY'),
    ]),
    Entry('LEDGERS', <Entry>[
      Entry('GENERAL LEDGER'),
      Entry('STATEMENT OF ACCOUNTS'),
      Entry('SCREEN LEDGER'),
      Entry('DETAIL LEDGER'),
      Entry('GROUP LEDGER'),
      Entry('CUSTOMER LEDGER'),
      Entry('SUPPLIERS LEDGER'),
      Entry('ITEMWISE LEDGER'),
      Entry('DAYWISE LEDGER'),
      Entry('MONTH WISE LEDGER'),
      Entry('ALL A/C REPORT'),
    ]),
    Entry('REGISTERS', <Entry>[
      Entry('AAVAK REGISTER'),
      Entry('DHADA REGISTER'),
      Entry('SALES REGISTER'),
      Entry('PURCHASE REGISTER'),
      Entry('LOTWISE DHADA REGISTER'),
      Entry('SALES SUMMERY REPOST'),
      Entry('ITEMWISE SALES REPOST'),
      Entry('SALES SUMMERY MONTHLY REPOST'),
    ]),
    Entry('TRANSPORT REPORT', <Entry>[
      Entry('TRANSPORT REPORT'),
      Entry('TRANSPORT COMM REPORT'),
      Entry('TRANSPORT WISE PATTI O/S'),
      Entry('TRANSPORT WISE PATTI DATE O/S'),
    ]),
    Entry('ADDITIONAL REPORT', <Entry>[
      Entry('APMC DAILY REPORT'),
      Entry('VACHHATWISE DAILY REPORT'),
      Entry('MONTHWISE P & L  REPORT'),
      Entry('VACHHATWISE REPORT'),
      Entry('VACHHATWISE SUMMERY REPORT'),
      Entry('GB DAILY REPORT'),
      Entry('GB MONTHLY REPORT'),
      Entry('GB MONTHLY ENTRY REPORT'),
    ]),
    Entry('CUSTOMERS REPORT', <Entry>[
      Entry('LEDGER SALES O/S REPORT'),
      Entry('LEDGER SALES O/S LEBLE REPORT'),
      Entry('PARTYWISE SALES REPORT'),
      Entry('LEDGER SALES O/S 90 DAYS REPORT'),
    ]),
  ]),
  Entry("UTILITY", <Entry>[
    Entry('REINDEX', <Entry>[
      Entry("REINDEX"),
      Entry("FILE CLEAN"),
      Entry("UPDATE ACCOUNT"),
      Entry("UPDATE BILLS"),
      Entry("UPDATE CASH BOOK"),
    ]),
    Entry('REPORT FILES', <Entry>[
      Entry("REPORT VIEW"),
      Entry("REPORT PRINT"),
      Entry("REPORT EDIT"),
      Entry("REPORT DELETE"),
    ]),
    Entry('BILL PRINTS', <Entry>[
      Entry("BILL PRINTING"),
      Entry("BILL DELETE"),
      Entry("BILL BALANCE"),
      Entry("PARTY WISE BILL"),
      Entry("PLAIN BILL PRINTING"),
    ]),
    Entry("PATTI PRINTING", <Entry>[
      Entry("PATTI PREPAIR"),
      Entry("PATTI PRINTING  (ENGLISH)"),
      Entry("PATTI DELETE"),
      Entry("PATTI BALANCE"),
      Entry("PATTI PRINTING MARATHI"),
      Entry("SINGLE PATTI DELETE"),
      Entry("STOCK ADJESTMENT"),
      Entry("PLAIN PAPER PATTI PRINTING"),
      Entry("HUNDEKARI CHANGE"),
    ]),
    Entry("END OF YEAR", <Entry>[
      Entry("NEXT YEAR FILE TRANSFER"),
      Entry("BALANCE TRANSFER"),
      Entry("BILL TRANSFER"),
      Entry("PATTI TRANSFER"),
    ]),
    Entry("PARTY FOLIO", <Entry>[
      Entry("ADDRESS BOOK"),
      Entry("ACCOUNT LIST"),
      Entry("PARTY MAIL ID / PANCARD / MOBILE NO & OTHER"),
    ])
  ]),
  Entry("BALANCE SHEETS", <Entry>[
    Entry("P & L STATEMENT REPORT"),
    Entry("TRIAL BALANCE REPORT"),
    Entry("SCHEDULES REPORT"),
    Entry("BALANCE SHEETS REPORT"),
    Entry("EOY KASAR DR  GROUP WISE"),
    Entry("EOY KASAR CR GROUP WISE"),
    Entry("TRIAL BALANCE DETAILS SCREEN"),
    Entry("SCHEDULES DETAILS SCREEN"),
  ])
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
      color: ToolkitColors.primary,
    );

TextStyle kTextFormFieldStyle() => const TextStyle(color: Colors.black);

var defaultBackgroundColor = Colors.grey[300];
var appBarColor = ToolkitColors.black;
var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
