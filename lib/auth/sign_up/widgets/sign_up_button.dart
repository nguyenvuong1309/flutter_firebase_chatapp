import 'dart:io';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_chatapp/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter_firebase_chatapp/firebase_chat/services/index.dart';
import 'package:flutter_firebase_chatapp/l10n/l10n.dart';
import 'package:get_it/get_it.dart';


class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    this.avatarFile,
  });

  final File? avatarFile;

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
    final isLoading = context
        .select((SignUpCubit bloc) => bloc.state.submissionStatus.isLoading);
    final AuthService _authService = GetIt.instance.get<AuthService>();
    final child = switch (isLoading) {
      true => AppButton.inProgress(style: style, scale: 0.5),
      _ => AppButton.auth(
          context.l10n.signUpText,
          () async {
            print("🚀 ~ SignUpButton ~ Widgetbuild ~ context:");

            bool result = await _authService.signup(
                "21522809@gm.uit.edu.vn", "123456789");
            print("🚀 ~ SignUpButton ~ Widgetbuild ~ $result:");
            // context.read<SignUpCubit>().onSubmit(avatarFile: avatarFile);
          },
          
          style: style,
          outlined: true,
        ),
    };
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: switch (context.screenWidth) {
          > 600 => context.screenWidth * .6,
          _ => context.screenWidth,
        },
      ),
      child: child,
    );
  }
}
