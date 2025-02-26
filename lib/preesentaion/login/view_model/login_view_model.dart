import 'dart:async';
import 'package:advanced_1/domain/use_case/login_usecasee.dart';
import 'package:advanced_1/preesentaion/base/baseViewModel.dart';
import 'package:advanced_1/preesentaion/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("", "");
  final LoginUseCasee _loginUseCasee;
  LoginViewModel(this._loginUseCasee);

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
    super.dispose();
  }

  @override
  void Start() {
    // TODO: implement Start
    super.Start();
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUsername
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
  }

  @override
  setUserName(String userName) {
    inputUsername.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
  }

  ///outputs
  @override
  Stream<bool> get outIsPasswordValidate => _passwordStreamController.stream
      .map((password) => _isPaswoordValid(password));

  @override
  Stream<bool> get outIsUsernameValidate => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));
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
}

abstract class LoginViewModelOutput {
  Stream<bool> get outIsUsernameValidate;
  Stream<bool> get outIsPasswordValidate;
}
