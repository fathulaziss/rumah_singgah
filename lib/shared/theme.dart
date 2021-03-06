import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = Color(0xFF5843BE);
Color orangeColor = Color(0xFFFF9376);
Color blackColor = Color(0xFF000000);
Color whiteColor = Color(0xFFFFFFFF);
Color greyColor = Color(0xFF82868E);
Color semiGreyColor = Color(0xFFF6F7F8);

const double defaultMargin = 24;

TextStyle blackTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: blackColor);

TextStyle whiteTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: whiteColor);

TextStyle greyTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w300, color: greyColor);

TextStyle purpleTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w500, color: purpleColor);

TextStyle regulerTextStyle = GoogleFonts.poppins()
    .copyWith(fontWeight: FontWeight.w400, color: blackColor);
