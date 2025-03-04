import 'package:flutter/widgets.dart';
import 'package:store_vista/app/constant.dart';
import 'package:store_vista/preesentaion/common/state_renderer/state_render.dart';

abstract class FlowState {
  StateRenderType getStateRendererType();
  String getMessage();
}

// Loading State (popup,Full Screen)
class LoadingState extends FlowState {
  LoadingState(this.stateRenderType, this.message);
  StateRenderType stateRenderType;
  String message;
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRendererType() => stateRenderType;
}

// Error State (popup,Full Screen)
class ErrorState extends FlowState {
  ErrorState(this.stateRenderType, this.message);
  StateRenderType stateRenderType;
  String message;
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRendererType() => stateRenderType;
}

// Content State
class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() => Constant.empty;

  @override
  StateRenderType getStateRendererType() => StateRenderType.contentState;
}

// Empty State
class EmptyState extends FlowState {
  String message;
  EmptyState(this.message);
  @override
  String getMessage() => message;

  @override
  StateRenderType getStateRendererType() =>
      StateRenderType.fullScreenEmptyState;
}

extension FlowStatwExtention on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreen,
    Function retryAction,
  ) {
    switch (runtimeType) {
      case LoadingState:
        {
          break;
        }
      case ErrorState:
        {
          break;
        }
      case EmptyState:
        {
          break;
        }
      case ContentState:
        {
          break;
        }
      
    }
  }
}
