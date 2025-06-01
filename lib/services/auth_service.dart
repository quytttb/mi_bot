import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'environment.dart';


class AuthService {
  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  String? _refreshToken;
  String? _accessToken;
  String? _idToken;
  String? _accessTokenExpirationDateTime;

  // String? _userInfo;

  final List<String> _scopes = <String>[ 'openid', 'profile', 'email' ];

  final AuthorizationServiceConfiguration _serviceConfiguration = AuthorizationServiceConfiguration(
    authorizationEndpoint: Environment.authorizationEndpoint,
    tokenEndpoint: Environment.tokenEndpoint,
    endSessionEndpoint: Environment.endSessionEndpoint,
  );

  Future<EndSessionResponse?> signOut({ExternalUserAgent externalUserAgent = ExternalUserAgent.asWebAuthenticationSession}) async {
    try {
      _accessToken = await _secureStorage.read(key: "accessToken");
      _idToken = await _secureStorage.read(key: "idToken");
      _refreshToken = await _secureStorage.read(key: "refreshToken");
      _accessTokenExpirationDateTime = await _secureStorage.read(key: "accessTokenExpirationDateTime");

      final EndSessionResponse result = await _appAuth.endSession(EndSessionRequest(
          idTokenHint: _idToken,
          postLogoutRedirectUrl: Environment.redirectUrl,
          serviceConfiguration: _serviceConfiguration,
          externalUserAgent: externalUserAgent));
      _clearSessionInfo();
      return result;
    } catch (e) {
      return null;
    }
  }

  void _clearSessionInfo() {
    _accessToken = null;
    _idToken = null;
    _refreshToken = null;
    _accessTokenExpirationDateTime = null;
  }

  Future<TokenResponse?> refresh() async {
    try {
      final TokenResponse result = await _appAuth.token(TokenRequest(
          Environment.clientId,
          Environment.redirectUrl,
          refreshToken: _refreshToken,
          issuer: Environment.issuer,
          scopes: _scopes,
          clientSecret: Environment.clientSecret));
      _processTokenResponse(result);
      return result;
    } catch (e) {
      return null;
    }
  }

  void _processTokenResponse(TokenResponse response) {
    _accessToken = response.accessToken!;
    _idToken = response.idToken!;
    _refreshToken = response.refreshToken!;
    _accessTokenExpirationDateTime = response.accessTokenExpirationDateTime!.toIso8601String();
  }

  Future<AuthorizationTokenResponse?> signIn({ExternalUserAgent externalUserAgent = ExternalUserAgent.asWebAuthenticationSession}) async {
    try {
      final AuthorizationTokenResponse result = await _appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
          Environment.clientId, Environment.redirectUrl,
          serviceConfiguration: _serviceConfiguration,
          scopes: _scopes,
          externalUserAgent: externalUserAgent,
          clientSecret: Environment.clientSecret));
      _saveSessionInfo(result);
      return result;
    } catch (e) {
      return null;
    }
  }

  void _saveSessionInfo(AuthorizationTokenResponse response) async {
    _accessToken = response.accessToken!;
    _idToken = response.idToken!;
    _refreshToken = response.refreshToken!;
    _accessTokenExpirationDateTime = response.accessTokenExpirationDateTime!.toIso8601String();

    await _secureStorage.write(key: "accessToken", value: _accessToken);
    await _secureStorage.write(key: "idToken", value: _idToken);
    await _secureStorage.write(key: "refreshToken", value: _refreshToken);
    await _secureStorage.write(key: "accessTokenExpirationDateTime", value: _accessTokenExpirationDateTime);
  }

// void _handleError(Object e) {
//   if (e is FlutterAppAuthUserCancelledException) {
//     _error = 'The user cancelled the flow!';
//     print(_error);

//   } else if (e is FlutterAppAuthPlatformException) {
//     _error = e.platformErrorDetails.toString();
//     print(_error);
//   } else if (e is PlatformException) {
//     _error = 'Error\n\n'
//               'Code: ${e.code}\n'
//               'Message: ${e.message}\n'
//               'Details: ${e.details}';
//     print(_error);
//   } else {
//     _error = 'Error: $e';
//     print(_error);
//   }
// }

}