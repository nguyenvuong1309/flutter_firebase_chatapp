import 'package:flutter/material.dart';
import 'package:flutter_firebase_chatapp/modules/auth/pages/sign_in/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildLogo() {
      return Container(
          width: 110.w,
          margin: EdgeInsets.only(top: 84.h),
          child: Column(
            children: [
              Container(
                  width: 76.w,
                  height: 76.w,
                  margin: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Stack(children: [
                    Positioned(
                        child: Container(
                      height: 76.w,
                      decoration: const BoxDecoration(
                          color: Color(0xFF151026),
                          //AppColors.primaryBackground,
                          boxShadow: [
                            //Shadows.primaryShadow
                            BoxShadow(
                              color: const Color(
                                  0x7F000000), // Shadow color with opacity
                              blurRadius: 10.0, // How much the shadow will blur
                              spreadRadius:
                                  2.0, // How much the shadow will spread
                              offset:
                                  Offset(5, 5), // x and y offset of the shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(35))),
                    )),
                    Positioned(
                        child: Image.asset(
                      "assets/images/chat-icon.jpg",
                      width: 76.w,
                      height: 76.w,
                      fit: BoxFit.cover,
                    ))
                  ])),
              Container(
                margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
                child: Text("Let's chat",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        //color: Color.fromARGB(31, 12, 11, 11),
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        height: 1)),
              )
            ],
          ));
    }

    Widget _buildThirdPartyLogin() {
      return Container(
          width: 295.w,
          margin: EdgeInsets.only(bottom: 280.h),
          child: Column(children: [
            Text("Sign in with social networks",
                textAlign: TextAlign.center,
                style: TextStyle(
                  // color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                )),
            Padding(
                padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
                child: ElevatedButton(
                    onPressed: () {
                      controller.handleSignIn();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: Color.fromARGB(255, 5, 99, 176),
                      minimumSize: Size(250, 100),
                      // backgroundColor: WidgetStateProperty.all<Color>(
                      //     Color.fromARGB(255, 5, 99, 176)),
                    ),
                    child: const Text("Google Login",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)))
                    // const Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text("Google Login",
                    //         style: TextStyle(
                    //             color: Color.fromARGB(255, 255, 255, 255)))
                    //   ],
                    // ),
                    ))
          ]));
    }

    return Scaffold(
        body: Center(
            child: Column(
      children: [_buildLogo(), Spacer(), _buildThirdPartyLogin()],
    )));
  }
}
