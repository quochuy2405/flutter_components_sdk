import 'package:flutter_components_sdk/core/network/base.dart';
import 'package:http/http.dart' as http;

class ProfileClient extends ApiClient {
  ProfileClient() : super(API_HOST);

  // Method to update user profile
  Future<http.Response> updateUserProfile(
      Map<String, dynamic> userProfile) async {
    return patch('user/profile', userProfile);
  }

  // Method to get user profile
  Future<http.Response> getUserProfile() async {
    return get('user/profile');
  }

  // Method to update user's phone number
  Future<http.Response> updatePhoneNumber(String phoneNumber) async {
    return patch('user/profile', {'phoneNumber': phoneNumber});
  }

  // Method to update user bio
  Future<http.Response> updateBio(String bio) async {
    return patch('user/profile', {'bio': bio});
  }

  // Method to set social profile URL
  Future<http.Response> setSocialProfileUrl(String type, String url) async {
    return post('user/social-fallback', {},
        params: {'type': type, 'url': url});
  }

  // Method to delete user assets
  Future<http.Response> deleteUserAssets(List<String> deleteGalleryIds) async {
    if (deleteGalleryIds.isEmpty) return Future.value(http.Response('', 200));
    return patch('user/galleries', {'deleteGalleryIds': deleteGalleryIds});
  }

  // Method to upload user assets
  Future<http.Response> uploadUserAssets(
      List<Map<String, dynamic>> userGalleries) async {
    return patch('user/galleries', {'userGalleries': userGalleries});
  }

  // Method to update user categories
  Future<http.Response> updateCategories(List<String> categoryIds) async {
    return patch('user/info', {'categoryIds': categoryIds});
  }

  // Method to get pricing list
  Future<http.Response> getPricingList() async {
    return get('kol-pricing/list', params: {'page': '1', 'take': '100'});
  }
}

final profileClient = ProfileClient();
