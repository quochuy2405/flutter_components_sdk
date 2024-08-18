import 'package:flutter_components_sdk/core/network/base.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_components_sdk/core/utils/session.dart';

// User-related operations
class UserClient extends ApiClient {
  UserClient() : super(API_HOST);

  // Upload avatar
  Future<http.Response> uploadAvatar(String? nameAvatar) async {
    return post('/user/presigned-url', {
      'nameAvatar': nameAvatar,
    });
  }

  // Upload background
  Future<http.Response> uploadBackground(String nameBackground) async {
    return post('/user/presigned-url', {
      'nameBackground': nameBackground,
    });
  }

  // Get user information
  Future<http.Response> getUserInfo() async {
    final notificationToken = await SessionManager.getSession('@expoPushToken');
    return get('user', params: {
      'notificationToken': notificationToken,
    });
  }

  // Verify code by phone number
  Future<http.Response> getVerifyCodeByPhoneNumber(String phone) async {
    return post('/user/phone', {
      'phone': phone,
    });
  }

  // Apply agency code
  Future<http.Response> requestApplyAgencyCode(String code) async {
    return post('kol/agency', {
      'code': code,
    });
  }

  // Update profile setup
  Future<http.Response> updateProfileSetup(Map<String, dynamic> data) async {
    final token = await SessionManager.getSession('@opt_token');
    if (token == null) {
      throw Exception('Token is required for this operation.');
    }

    return post('user/create', {
      ...data,
      'roleName': 'KOL',
    }, params: {
      'token': token,
    });
  }

  // Verify profile by ID card
  Future<http.Response> requestVerifyProfileByIdCard(
      Map<String, dynamic> data) async {
    return put('/user/requestVerifyProfileByIdCard', data);
  }

  // Verify profile by form
  Future<http.Response> requestVerifyProfileByForm(
      Map<String, dynamic> data) async {
    return put('/billing/idcard', data);
  }

  // Request to delete user
  Future<http.Response> requestDeleteUser() async {
    return patch('/user/block', {});
  }

  // Get verify profile info
  Future<http.Response> getVerifyProfileInfo() async {
    return get('/billing/idcard');
  }

  // Search tags
  Future<http.Response> requestSearchTag(String search) async {
    return get('/categories/list', params: {
      'search': search,
      'take': '20',
    });
  }

  // Block user
  Future<http.Response> onBlockUser(int? id) async {
    return post('moderation/block-user', {
      'entityId': id,
    });
  }

  // Update user settings
  Future<http.Response> requestUpdateSetting(
      Map<String, dynamic> notifications) async {
    return put('/user/requestVerifyProfileByIdCard', notifications);
  }
}

final userClient = UserClient();
