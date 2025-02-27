import 'package:advanced_1/data/network/Failure.dart';
import 'package:advanced_1/preesentaion/resources/strings_manager.dart';
import 'package:flutter/material.dart';

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
   StateRender({
    super.key,
    required this.stateRenderType,
    this.message = AppStrings.loading,
    this.title = "",
    required this.retryActionFunction
    });
  StateRenderType stateRenderType;
  String message;
  String title;
  Function retryActionFunction;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }



  Widget _getStateWidget(){
    switch(stateRenderType){
      
      case StateRenderType.popupLoadingState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRenderType.popupErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRenderType.fullScreenLoadingState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRenderType.fullScreenEmptyState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRenderType.fullScreenErrorState:
        // TODO: Handle this case.
        throw UnimplementedError();
      case StateRenderType.contentState:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  Widget _getItemsColumn(List<Widget> children){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children
    );
  }
}
