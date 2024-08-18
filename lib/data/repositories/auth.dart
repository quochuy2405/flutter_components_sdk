import 'package:flutter_components_sdk/core/network/base.dart';
import 'package:flutter_components_sdk/core/utils/session.dart';
import 'package:http/http.dart' as http;

class AuthClient extends ApiClient {
  AuthClient() : super(API_HOST);

  Future<http.Response> login(String email, String password) async {
    return post('auth/login', {
      'email': email,
      'password': password,
    });
  }

  Future<http.Response> loginGoogle(String token) async {
    return post('auth/login-google', {'token': token});
  }

  Future<http.Response> loginFacebook(String token) async {
    return post('auth/login-facebook', {'token': token});
  }

  Future<http.Response> refreshToken() async {
    return post('auth/refresh-token', {
      'refreshToken': await SessionManager.getSession('refresh_token'),
    });
  }

  Future<http.Response> signOut() async {
    await SessionManager.removeSession('access_token');
    await SessionManager.removeSession('refresh_token');
    await SessionManager.clearAllSessions();
    // Navigate to sign-in screen
    return post('auth/sign-out', {});
  }
}
