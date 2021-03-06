import 'package:first_json/models/coordinates.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(
    explicitToJson: true
)
class Address {
  final String address;
  final String? city;
  final Coordinates coordinates;
  final String postalCode;
  final String state;

  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state
  });
  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString(){
    return '$address - $postalCode - ${city ?? ''}';
  }
}