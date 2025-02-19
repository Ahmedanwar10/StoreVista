import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'responces.g.dart';
@JsonSerializable()
class BaseResponce{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "massage")
  String? massage;
  // مش هنعمل constactor علشان مينطلبش مني
}
@JsonSerializable()
class customerResponce{
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfnotifications")
  int? numOfnotifications;
  customerResponce(this.id,this.name,this.numOfnotifications);
   factory customerResponce.fromJson(Map<String, dynamic> json) =>
      _$customerResponceFromJson(json);
   Map<String, dynamic> toJson() => _$customerResponceToJson(this);

}
@JsonSerializable()
class contactsResponce{
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  contactsResponce(this.phone,this.email,this.link);
  factory contactsResponce.fromJson(Map<String, dynamic> json) =>
      _$contactsResponceFromJson(json);
   Map<String, dynamic> toJson() => _$contactsResponceToJson(this);

}
@JsonSerializable()
class AuthenticationResponce extends BaseResponce {
  @JsonKey(name: "customer")
  customerResponce? customer;

  @JsonKey(name: "contacts")
  contactsResponce? contacts;

  AuthenticationResponce(this.customer, this.contacts);

  // تعريف factory method داخل الكلاس
  factory AuthenticationResponce.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponceFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationResponceToJson(this);
}

//flutter pub get && flutter pub run build_runner --delete-conflicting-outputs
//flutter pub run build_runner build --delete-conflicting-outputs
