import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = const Color(0xFF42A5F5),
  String title = "button",
  Color fontColor = const Color.fromARGB(255, 230, 235, 239),
  double fontSize = 16,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16.sp)),
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.focused) &&
                  !states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } else if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 122, 4, 248);
              }
              return fontColor;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const Color.fromARGB(255, 14, 174, 253);
            }
            return gbColor;
          }),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))))),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          height: 1,
        ),
      ),
    ),
  );
}

Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return Container(
      width: width.w,
      height: height.h,
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))))),
        onPressed: onPressed,
        child: Image.asset(
          "assets/images/icons-$iconFileName.png",
        ),
      ));
}
