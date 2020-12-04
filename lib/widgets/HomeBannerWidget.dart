import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';
class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: double.infinity,
      height: 120.0,
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: KButtonColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 16.0, 0.0, 0.0),
            child: Row(
              children: [
                Text(
                  "30%",
                  style: GoogleFonts.cabin(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Discount for",
                  style: GoogleFonts.cabin(
                    color: Colors.black,
                    fontSize: 22.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0.0, 16.0, 0.0),
            child: Text(
              "Fast Food",
              style: GoogleFonts.cabin(
                color: Colors.black,
                fontSize: 22.0,
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, bottom: 16.0),
            child: Text(
              "Valid until july 23",
              style: GoogleFonts.cabin(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
