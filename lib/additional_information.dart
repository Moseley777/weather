import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*   DEFINING THE TEXT TITLEFONT USED BELOW FOR WIND TEXT AND PRESSURE TEXT INSTEAD OF SETTING IT MULTIPLE TIMES(ALREADY DID ONCE FOR THE WIND...COULD ALSO CHANGE IT TO titleFont)*/
TextStyle titleFont = 
    const TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0);

TextStyle infoFont =     
     const TextStyle(fontWeight: FontWeight.w400,fontSize: 18.0);

Widget additionalInformation(

  
  String wind,String humidity,String pressure,String feels_like){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Wind',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                ),
                SizedBox(height: 18.0,),
                Text(
                  'Pressure',
                  style: titleFont,
                )
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$wind',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
                ),
                SizedBox(height: 18.0,),
                Text(
                  '$pressure',
                  style: infoFont,
                )
              ],
            ),

             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Humidity',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                ),
                SizedBox(height: 18.0,),
                Text(
                  'Fels Like',
                  style: titleFont,
                )
              ],
            ),

             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$humidity',
                style: infoFont,
                ),
                SizedBox(height: 18.0,),
                Text(
                  '$feels_like',
                  style: infoFont,
                )
              ],
            ),
          ],
        )
      ],
    ),
  );
}