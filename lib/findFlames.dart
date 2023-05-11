import 'package:flutter/cupertino.dart';

class Flames
{
 TextEditingController boyname;
 TextEditingController girlname;
 String flames = 'FLAMES';
 Flames({required this.boyname, required this.girlname});
 String findFlames()
 {
   int sum = 0;
   String bname = boyname.toString();
   String gname = girlname.toString();
   bname = bname.toLowerCase();
   gname = gname.toLowerCase();
   var arr1 = List.filled(26,0);
   var arr2 = List.filled(26,0);
   int len1 = bname.length;
   int len2 = gname.length;
   for(int i = 0; i < len1; i++)
   {
     if(bname.codeUnitAt(i)-97 >= 0 && bname.codeUnitAt(i)-97 <= 25)
     {
      arr1[(bname.codeUnitAt(i))-97]++;
    }
   }
   for(int i = 0; i < len2; i++)
   {
    if(gname.codeUnitAt(i)-97 >= 0 && gname.codeUnitAt(i)-97 <= 25) {
      arr2[(gname.codeUnitAt(i))-97]++;
    }
   }
   for(int i = 0; i < 26; i++)
   {
    sum += (arr1[i]-arr2[i]).abs();
   }
   if (sum == 0) {
     return 'Invalid Name';
   }
   int i = sum - 1;
   while(flames.length > 1)
   {
    if(i >= flames.length)
    {
     i = i%flames.length;
    }
    flames = flames.substring(0,i)+flames.substring(i+1);
    i += sum-1;
   }
  return flames;
 }

}