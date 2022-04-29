// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      maidenName: json['maidenName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      birthdate: json['birthdate'] as String,
      image: json['image'] as String,
      bloodGroup: json['bloodGroup'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      eyeColor: json['eyeColor'] as String,
      hair: Hair.fromJson(json['hair'] as Map<String, dynamic>),
      domain: json['domain'] as String,
      ip: json['ip'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      macAddress: json['macAddress'] as String,
      university: json['university'] as String,
      bank: Bank.fromJson(json['bank'] as Map<String, dynamic>),
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      ein: json['ein'] as String,
      ssn: json['ssn'] as String,
      userAgent: json['userAgent'] as String,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'maidenName': instance.maidenName,
      'age': instance.age,
      'gender': instance.gender,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
      'birthdate': instance.birthdate,
      'image': instance.image,
      'bloodGroup': instance.bloodGroup,
      'height': instance.height,
      'weight': instance.weight,
      'eyeColor': instance.eyeColor,
      'hair': instance.hair.toJson(),
      'domain': instance.domain,
      'ip': instance.ip,
      'address': instance.address.toJson(),
      'macAddress': instance.macAddress,
      'university': instance.university,
      'bank': instance.bank.toJson(),
      'company': instance.company.toJson(),
      'ein': instance.ein,
      'ssn': instance.ssn,
      'userAgent': instance.userAgent,
    };
