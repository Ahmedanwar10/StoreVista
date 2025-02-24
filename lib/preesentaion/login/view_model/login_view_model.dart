
import 'dart:async';

import 'package:advanced_1/preesentaion/base/baseViewModel.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput, LoginViewModelOutput {
final StreamController _userNameStreamController =StreamController<String>();
final StreamController _passwordStreamController =StreamController<String>();



  @override
  void dispose() {
    // TODO: implement dispose
    
  }
  @override
  void Start() {
    // TODO: implement Start
    super.Start();
  }
  
  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();
  
  @override
  // TODO: implement inputUsername
  Sink get inputUsername => throw UnimplementedError();
  
  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }
  
  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
  }


  ///outputs 
    @override
  // TODO: implement outIsPasswordValidate
  Stream<bool> get outIsPasswordValidate => throw UnimplementedError();
  
  @override
  // TODO: implement outIsUsernameValidate
  Stream<bool> get outIsUsernameValidate => throw UnimplementedError();
  
}

mixin LoginViewModelInput {
setUserName(String userName);
setPassword(String password);
login();


Sink get inputUsername; 
Sink get inputPassword; 

}

mixin LoginViewModelOutput {
 Stream<bool>get outIsUsernameValidate;
  Stream<bool>get outIsPasswordValidate;

}