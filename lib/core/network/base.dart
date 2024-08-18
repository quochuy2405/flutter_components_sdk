import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_components_sdk/core/utils/session.dart';

const String API_HOST = "";

class ApiClient {
  final String _baseUrl;

  ApiClient(this._baseUrl);

  Future<http.Response> get(String endpoint,
      {Map<String, String?>? params}) async {
    final token = await SessionManager.getSession('access_token');
    final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: params);
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 401) {
      await _handleUnauthorized();
      return await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${await SessionManager.getSession('access_token')}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
    }

    return response;
  }
  Future<http.Response> delete(String endpoint,
      {Map<String, String?>? params}) async {
    final token = await SessionManager.getSession('access_token');
    final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: params);
    final response = await http.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 401) {
      await _handleUnauthorized();
      return await http.get(
        uri,
        headers: {
          'Authorization':
              'Bearer ${await SessionManager.getSession('access_token')}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
    }

    return response;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? params}) async {
    final token = await SessionManager.getSession('access_token');
     final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: params);
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 401) {
      await _handleUnauthorized();
      return await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Authorization':
              'Bearer ${await SessionManager.getSession('access_token')}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
    }

    return response;
  }
  Future<http.Response> patch(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? params}) async {
    final token = await SessionManager.getSession('access_token');
    final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: params);
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 401) {
      await _handleUnauthorized();
      return await http.put(
        Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Authorization':
              'Bearer ${await SessionManager.getSession('access_token')}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
    }

    return response;
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> body,
      {Map<String, String>? params}) async {
    final token = await SessionManager.getSession('access_token');
    final uri =
        Uri.parse('$_baseUrl$endpoint').replace(queryParameters: params);
    final response = await http.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 401) {
      await _handleUnauthorized();
      return await http.post(
        Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Authorization':
              'Bearer ${await SessionManager.getSession('access_token')}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );
    }

    return response;
  }

  Future<void> _handleUnauthorized() async {
    await _refreshToken();
  }

  Future<void> _refreshToken() async {
    final refreshToken = await SessionManager.getSession('refresh_token');
    final response =
        await post('auth/refresh-token', {'refreshToken': refreshToken});
    final data = jsonDecode(response.body);

    if (data['data']['accessToken'] != null) {
      await SessionManager.setSession(
          'access_token', data['data']['accessToken']);
      await SessionManager.setSession(
          'refresh_token', data['data']['refreshToken']);
    } else {
      await _signOut();
    }
  }

  Future<void> _signOut() async {
    await SessionManager.removeSession('access_token');
    await SessionManager.removeSession('refresh_token');
    await SessionManager.clearAllSessions();
    // Navigate to sign-in screen
  }
}

final apiClient = ApiClient(API_HOST);
