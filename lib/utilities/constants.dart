import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const kBlueColor = Color(0xFF2980B9);
const kDarkGray = Color(0xFF262D40);
const kLightGray = Color(0xFFF7F8FA);
const kBlackColor = Color(0xFF181818);

const kGreetingStyle = TextStyle(
  color: kDarkGray,
  fontSize: kIsWeb ? 22.0 : 16.0,
  fontWeight: FontWeight.w400,
);

const kHeadingStyle = TextStyle(
  color: kDarkGray,
  fontSize: kIsWeb ? 28.0 : 22.0,
  fontWeight: FontWeight.bold,
);

const kSectionTitleStyle = TextStyle(
  color: kDarkGray,
  fontWeight: FontWeight.w500,
  fontSize: kIsWeb ? 28.0 : 22,
);

const kProjectCardTitleStyle = TextStyle(
  color: kDarkGray,
  fontWeight: FontWeight.w800,
  fontSize: kIsWeb ? 20.0 : 16.0,
);
