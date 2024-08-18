import 'package:flutter_components_sdk/core/constants/enum.dart';

class Pricing {
  final String? id;
  final String description;
  final String? price;
  final String contentDurationType;
  final ESocialType? socialType;
  final Platforms? platforms;
  final ESocialContent contentType;

  Pricing({
    this.id,
    required this.description,
    this.price,
    required this.contentDurationType,
    this.socialType,
    this.platforms,
    required this.contentType,
  });

  // Method to convert Pricing instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'price': price,
      'contentDurationType': contentDurationType,
      'socialType': socialType?.toString(),
      'platforms': platforms?.toJson(),
      'contentType': contentType.toString(),
    };
  }

  // Method to create Pricing instance from JSON
  factory Pricing.fromJson(Map<String, dynamic> json) {
    return Pricing(
      id: json['id'],
      description: json['description'],
      price: json['price'],
      contentDurationType: json['contentDurationType'],
      socialType: ESocialType.values.firstWhere(
        (e) => e.toString() == json['socialType'],
        // orElse: () => null,
      ),
      platforms: json['platforms'] != null
          ? Platforms.fromJson(json['platforms'])
          : null,
      contentType: ESocialContent.values.firstWhere(
        (e) => e.toString() == json['contentType'],
        // orElse: () => null,
      ),
    );
  }
}

// Define the Platforms class
class Platforms {
  final ESocialType name;

  Platforms({required this.name});

  // Method to convert Platforms instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name.toString(),
    };
  }

  // Method to create Platforms instance from JSON
  factory Platforms.fromJson(Map<String, dynamic> json) {
    return Platforms(
      name: ESocialType.values.firstWhere(
        (e) => e.toString() == json['name'],
        // orElse: () => Null,
      ),
    );
  }
}
