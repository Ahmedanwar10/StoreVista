import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_vista/preesentaion/resources/assets_manager.dart';
import 'package:store_vista/preesentaion/resources/colors.dart';
import 'package:store_vista/preesentaion/resources/font_manager.dart';
import 'package:store_vista/preesentaion/resources/strings_manager.dart';
import 'package:store_vista/preesentaion/resources/style_manager.dart';
import 'package:store_vista/preesentaion/resources/values_manager.dart';

enum StateRenderType {
  // POPUP STATE (DIALOG)
  popupLoadingState,
  popupErrorState,
  // FULL SCREEN STATE (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenEmptyState,
  fullScreenErrorState,
  // GENERAL
  contentState,
}

class StateRender extends StatelessWidget {
  StateRender(
      {super.key,
      required this.stateRenderType,
      this.message = AppStrings.loading,
      this.title = "",
      required this.retryActionFunction});
  StateRenderType stateRenderType;
  String message;
  String title;
  Function retryActionFunction;
  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRenderType) {
      case StateRenderType.popupLoadingState:
      _getPopupDialog(context,[_getAnimatedImage(JsonAssets.loading)]);
      
      case StateRenderType.popupErrorState:
        return _getPopupDialog(context,[
            _getAnimatedImage(JsonAssets.error),
            _getMassage(message),
            _getRetryAgain(AppStrings.ok, context),
        ]);
      
      case StateRenderType.fullScreenLoadingState:
        return _getItemsColumn(
          [
            _getAnimatedImage(JsonAssets.loading),
            _getMassage(message),
          ],
        );

      case StateRenderType.fullScreenEmptyState:
        _getItemsColumn(
        [
          _getAnimatedImage(JsonAssets.empty),
          _getMassage(message),
        ]);
     
      case StateRenderType.fullScreenErrorState:
        _getItemsColumn(
          [
            _getAnimatedImage(JsonAssets.error.toString()),
            _getMassage(message),
            _getRetryAgain(AppStrings.retryAgain, context),
          ],
        );
     
      case StateRenderType.contentState:
       return Container();
       default: Container();
    }
    return Container();
  }
  Widget _getPopupDialog(BuildContext context,List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: AppSize.s12,
              offset: Offset(AppSize.s0, AppSize.s12),
            ),
          ],
        ),
        child: _getDialogContent(context,children),
      ),
    );
  }
  Widget _getItemsColumn(List<Widget> children) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children);
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(width: 100, height: 100,
     child: LottieBuilder.asset(animationName)
     );
  }

  Widget _getMassage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryAgain(String buttonTitle,BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: (){
              if(stateRenderType == StateRenderType.fullScreenErrorState){
                retryActionFunction.call();
              }else{
                Navigator.of(context).pop();
              }
            },
            child: Text(buttonTitle),
          ),
        ),
      ),
    );
  }

Widget _getDialogContent(BuildContext context,List<Widget> children) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: children,
);
  }
}
