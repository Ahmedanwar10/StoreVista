
import 'package:advanced_1/preesentaion/login/view_model/login_view_model.dart';
import 'package:advanced_1/preesentaion/resources/assets_manager.dart';
import 'package:advanced_1/preesentaion/resources/strings_manager.dart';
import 'package:advanced_1/preesentaion/resources/values_manager.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel _viewModel = LoginViewModel(_loginUseCase);
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  _bind(){
    _viewModel.Start();
    _userNameController.addListener(() {
      _viewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _viewModel.setPassword(_passwordController.text);
    });
  } 

  

  @override
  void initState() {
    _bind();

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Container();
  }
   


   Widget _getContentWidget() { 
   return Container(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Center(
                    child: Image(image: AssetImage(ImageAssets.splashLogo))),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsUserNameValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _userNameController,
                          decoration: InputDecoration(
                              hintText: AppStrings.username.tr(),
                              labelText: AppStrings.username.tr(),
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.usernameError.tr()),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outIsPasswordValid,
                      builder: (context, snapshot) {
                        return TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _userPasswordController,
                          decoration: InputDecoration(
                              hintText: AppStrings.password,
                              labelText: AppStrings.password,
                              errorText: (snapshot.data ?? true)
                                  ? null
                                  : AppStrings.passwordError.tr()),
                        );
                      }),
                ),
                const SizedBox(
                  height: AppSize.s28,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outAreAllInputsValid,
                      builder: (context, snapshot) {
                        return SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                              onPressed: (snapshot.data ?? false)
                                  ? () {
                                      _viewModel.login();
                                    }
                                  : null,
                              child: Text(AppStrings.login.tr())),
                        );
                      }),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        top: AppPadding.p8,
                        left: AppPadding.p28,
                        right: AppPadding.p28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgotPasswordRoute);
                          },
                          child: Text(AppStrings.forgetPassword.tr(),
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.registerRoute);
                          },
                          child: Text(AppStrings.registerText,
                              style: Theme.of(context).textTheme.titleMedium).tr(),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
