import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/auth/divider_with_text.dart';
import '../../widgets/auth/login_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/auth/signup_button.dart';
import '../../widgets/auth/social_buttons.dart';
import '../../widgets/auth/welcome_text.dart';
import '../../widgets/logo.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            final isTablet = constraints.maxWidth >= 600;
            final isLandscape = orientation == Orientation.landscape;

            final paddingValue = isTablet ? 40.0 : 24.0;
            final containerWidth = isTablet ? 480.0 : constraints.maxWidth;
            final fontSizeTitle = isTablet ? 28.0 : 24.0;
            final fontSizeSubtitle = isTablet ? 18.0 : 14.0;
            final buttonHeight = isTablet ? 60.0 : 50.0;
            final iconSize = isTablet ? 200.0 : 80.0;
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(paddingValue),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: containerWidth),
                      child:
                          isLandscape && constraints.maxWidth > 900
                              ? _buildLandscapeLayout(
                                context,
                                ref,
                                fontSizeTitle,
                                fontSizeSubtitle,
                                buttonHeight,
                                iconSize,
                              )
                              : _buildPortraitLayout(
                                context,
                                ref,
                                fontSizeTitle,
                                fontSizeSubtitle,
                                buttonHeight,
                                iconSize,
                              ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPortraitLayout(
      BuildContext context,
      WidgetRef ref,
      double fontSizeTitle,
      double fontSizeSubtitle,
      double buttonHeight,
      double iconSize,
      ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Logo(iconSize: iconSize),
        const SizedBox(height: 24),
        WelcomeText(
          fontSizeTitle: fontSizeTitle,
          fontSizeSubtitle: fontSizeSubtitle,
        ),
        const SizedBox(height: 32),
        CustomTextField(
          label: 'Email',
          hintText: 'idoodle@gmail.com',
          //controller: emailController, // Thêm controller nếu cần
          fontSizeSubtitle: fontSizeSubtitle,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          label: 'Password',
          hintText: '••••••••••••••••',
          isPassword: true,
          //controller: passwordController, // Thêm controller nếu cần
          fontSizeSubtitle: fontSizeSubtitle,
        ),
        const SizedBox(height: 16),
        LoginButton(buttonHeight: buttonHeight),
        const SizedBox(height: 16),
        SignUpButton(buttonHeight: buttonHeight),
        const SizedBox(height: 16),
        DividerWithText(),
        const SizedBox(height: 16),
        SocialButtons(buttonHeight: buttonHeight),
      ],
    );
  }

  Widget _buildLandscapeLayout(
      BuildContext context,
      WidgetRef ref,
      double fontSizeTitle,
      double fontSizeSubtitle,
      double buttonHeight,
      double iconSize,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Logo(iconSize: iconSize * 1.2),
              const SizedBox(height: 24),
              WelcomeText(
                fontSizeTitle: fontSizeTitle,
                fontSizeSubtitle: fontSizeSubtitle,
              ),
            ],
          ),
        ),
        const SizedBox(width: 50),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                label: 'Email',
                hintText: 'idoodle@gmail.com',
                //controller: emailController, // Thêm controller nếu cần
                fontSizeSubtitle: fontSizeSubtitle,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Password',
                hintText: '••••••••••••••••',
                isPassword: true,
                //controller: passwordController, // Thêm controller nếu cần
                fontSizeSubtitle: fontSizeSubtitle,
              ),
              LoginButton(buttonHeight: buttonHeight),
              const SizedBox(height: 16),
              SignUpButton(buttonHeight: buttonHeight),
              const SizedBox(height: 16),
              DividerWithText(),
              const SizedBox(height: 16),
              SocialButtons(buttonHeight: buttonHeight),
            ],
          ),
        ),
      ],
    );
  }

}
