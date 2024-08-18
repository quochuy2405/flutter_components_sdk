import 'package:flutter_components_sdk/core/network/base.dart';
import 'package:flutter_components_sdk/data/models/user/pricing.dart';
import 'package:http/http.dart' as http;

class PricingClient extends ApiClient {
  PricingClient() : super(API_HOST);

  // Method to fetch pricing
  Future<http.Response> fetchPricing(Map<String, dynamic> data) async {
    return put('user/pricing/list', data);
  }

  // Method to create pricing
  Future<http.Response> createPricing(Pricing data) async {
    final body = {
      ...data.toJson(), // Assuming Pricing class has a toJson() method
      'price': data.price.toString(),
    };
    return post('kol-pricing/create', body);
  }

  // Method to update pricing
  Future<http.Response> updatePricing(Pricing data) async {
    final body = {
      ...data.toJson(), // Assuming Pricing class has a toJson() method
      'price': data.price.toString(),
    };
    return patch('kol-pricing/${data.id}', body);
  }

  // Method to delete pricing
  Future<http.Response> deletePricing(String id) async {
    return delete('kol-pricing/$id');
  }
}

final pricingClient = PricingClient();
