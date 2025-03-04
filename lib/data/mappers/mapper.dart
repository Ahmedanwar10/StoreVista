import 'package:store_vista/app/constant.dart';
import 'package:store_vista/app/extension.dart';
import 'package:store_vista/data/responses/responces.dart';
import 'package:store_vista/domain/models/models.dart';

extension CustomerResponceMapper on customerResponce? {
// create fun go from data to domain
  Customer toDomain() {
    return Customer(this?.id.orEmpty() ??Constant.empty, this?.name.orEmpty() ?? Constant.empty,
        this?.numOfnotifications.orZero() ??Constant.zero);
  }
}

extension ContactResponceMapper on contactsResponce? {
// create fun go from data to domain
  Contacts toDomain() {
    return Contacts(
    this?.phone.orEmpty()??Constant.empty,
    this?.email.orEmpty()??Constant.empty,
    this?.link.orEmpty()??Constant.empty,);
  }
}

extension AuthenticationResponceMapper on AuthenticationResponce? {
// create fun go from data to domain
Authentication toDomain(){
  return Authentication(
    this?.customer.toDomain(),
   this?.contacts.toDomain());
}

}