import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../strings/restaurant_home_strings.dart';

class CategoriesMenuWidget extends StatelessWidget {
  const CategoriesMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.list,color:Colors.white),
            SizedBox(width: 30,),
            Text(categoryText,style: GoogleFonts.jetBrainsMono(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900),)
          ],
        ),
      ),
    );
  }
}