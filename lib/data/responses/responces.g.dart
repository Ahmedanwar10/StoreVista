// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponce _$BaseResponceFromJson(Map<String, dynamic> json) => BaseResponce()
  ..status = (json['status'] as num?)?.toInt()
  ..massage = json['massage'] as String?;

Map<String, dynamic> _$BaseResponceToJson(BaseResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.massage,
    };

customerResponce _$customerResponceFromJson(Map<String, dynamic> json) =>
    customerResponce(
      json['id'] as String?,
      json['name'] as String?,
      (json['numOfnotifications'] as num?)?.toInt(),
    );

Map<String, dynamic> _$customerResponceToJson(customerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfnotifications': instance.numOfnotifications,
    };

contactsResponce _$contactsResponceFromJson(Map<String, dynamic> json) =>
    contactsResponce(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$contactsResponceToJson(contactsResponce instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponce _$AuthenticationResponceFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponce(
      json['customer'] == null
          ? null
          : customerResponce.fromJson(json['customer'] as Map<String, dynamic>),
      json['contacts'] == null
          ? null
          : contactsResponce.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = (json['status'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$AuthenticationResponceToJson(
        AuthenticationResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'massage': instance.massage,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
