import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../widgets/auth/loading_dialog.dart';

class KeycloakService {
  final FlutterAppAuth _appAuth = FlutterAppAuth();
  final String _clientId = dotenv.env['CLIENT_ID']!;
  final String _redirectUrl = dotenv.env['REDIRECT_URL']!;
  final String _issuer = dotenv.env['SSO_URL']!;
  final String _clientSecret = dotenv.env['CLIENT_SECRET']!;
  final String _discoveryUrl =
      '${dotenv.env['SSO_URL']}/realms/${dotenv.env['REALM']}/.well-known/openid-configuration';

  Future<void> login(BuildContext context, WidgetRef ref) async {
    // Show loading dialog
    LoadingDialog.show(context);

    try {
      print('ATTEMPTING TO CONNECT TO: $_discoveryUrl');

      final AuthorizationTokenResponse? result = await _appAuth
          .authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _clientId,
          _redirectUrl,
          discoveryUrl: _discoveryUrl,
          clientSecret: _clientSecret,
          scopes: ['openid', 'profile', 'email'],

          promptValues: ['login'], // Bắt buộc hiển thị màn hình đăng nhập
        ),
      );

      // Hide loading dialog
      if (context.mounted) LoadingDialog.hide(context);

      if (result != null) {
        print('ACCESS TOKEN: ${result.accessToken}');
        ref.read(authProvider).login(context);
      }
    } catch (e) {
      // Hide loading dialog on error
      if (context.mounted) LoadingDialog.hide(context);

      // Show error message with more details
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Connection error: ${e.toString()}')),
        );
      }
      print('LOGIN ERROR DETAILS: $e');
    }
  }

  Future<void> signup(BuildContext context, WidgetRef ref) async {
    // Keycloak does not have a separate signup endpoint, use login for both
    await login(context, ref);
  }
}
