import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    if (kReleaseMode) {
      return '.env.prod';
    }
    return '.env.dev';
  }

  static String get issuer {
    return  "${dotenv.env['SSO_URL']}/realms/${dotenv.env['REALM']}";
  }

  static String get clientId {
    return "${dotenv.env['CLIENT_ID']}";
  }

  static String get redirectUrl {
    return "${dotenv.env['REDIRECT_URL']}";
  }

  static String get clientSecret {
    return "${dotenv.env['CLIENT_SECRET']}";
  }

  static String get authorizationEndpoint {
    return  "${dotenv.env['SSO_URL']}/realms/${dotenv.env['REALM']}/protocol/openid-connect/auth";
  }

  static String get tokenEndpoint {
    return  "${dotenv.env['SSO_URL']}/realms/${dotenv.env['REALM']}/protocol/openid-connect/token";
  }

  static String get endSessionEndpoint {
    return  "${dotenv.env['SSO_URL']}/realms/${dotenv.env['REALM']}/protocol/openid-connect/logout";
  }

}