import 'dart:async';

import 'package:store_vista/domain/use_case/login_usecasee.dart';
import 'package:store_vista/preesentaion/base/baseViewModel.dart';
import 'package:store_vista/preesentaion/common/freezed_data_classes.dart';


class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject(password: "password", userName: "username");
  final LoginUseCasee _loginUseCasee;
  LoginViewModel(this._loginUseCasee);

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllStreamController.close();
    super.dispose();
  }

  @override
  void Start() {
    super.Start();
  }

  @override
  Sink get inputAreAll => _areAllStreamController.sink;


  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _userNameStreamController.sink;

  @override
  login() async {
    (await _loginUseCasee.execute(
            LoginUseCaseInput(loginObject.password, loginObject.userName)))
        .fold((failure) {
      print(failure.massage);
      print(failure.code);
    }, (data) {
      print(data.customer?.name);
    });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAll.add(null);
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAll.add(null);
  }

  ///outputs
  @override
  Stream<bool> get outIsPasswordValidate => _passwordStreamController.stream
      .map((password) => _isPaswoordValid(password));

  @override
  Stream<bool> get outIsUsernameValidate => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

            @override
            Stream<bool> get outAreAll => _areAllStreamController.stream
      .map((_) => loginObject.userName.isNotEmpty &&
          _isPaswoordValid(loginObject.password));

}

_isPaswoordValid(String password) {
  return password.isNotEmpty;
}

_isUserNameValid(String userName) {
  return userName.isNotEmpty;
}



abstract class LoginViewModelInput {
  setUserName(String userName);
  setPassword(String password);
  login();

  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputAreAll;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outIsUsernameValidate;
  Stream<bool> get outIsPasswordValidate;
  Stream<bool> get outAreAll;
}
