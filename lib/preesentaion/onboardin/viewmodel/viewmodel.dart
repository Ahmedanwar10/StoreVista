
// ignore_for_file: unused_field

import 'dart:async';

import 'package:store_vista/domain/models/models.dart';
import 'package:store_vista/preesentaion/base/baseViewModel.dart';
import 'package:store_vista/preesentaion/resources/assets_manager.dart';
import 'package:store_vista/preesentaion/resources/strings_manager.dart';

// ignore: camel_case_types
class OnBoardingViewModel extends BaseViewModel implements onBoardingViewModelInput, onBoardingViewModelOutput {
  final  _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list ;
 int _currentIndex =0 ;

  @override
  void  Start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }
  
  @override
  int getNext() {
    // TODO: implement getNext
   int  nextIndex =++ _currentIndex;
    if(nextIndex == _list.length){
      nextIndex =0;
    }
    return nextIndex;
  }
  
  @override
  int goPrevious() {
    // TODO: implement goPrevious
    int previousindex = _currentIndex;
    if(previousindex==-1){
      previousindex == _list.length-1;
    }
    return previousindex;
  }
  
  @override
  void onPageChange(int index) {
    // TODO: implement onPageChange
    _currentIndex = index;
    _postDataToView();
  }
  
  @override
  
  Sink get inputSliderViewObject =>_streamController.sink;



  
  @override
Stream<SliderViewObject> get outputSliderViewObject => _streamController.
stream.map((sliderViewObject) => sliderViewObject);


 // onboarding Private Function

 void _postDataToView(){
    inputSliderViewObject.
    add(SliderViewObject(_list[_currentIndex] as SliderViewObject, _list.length, _currentIndex));
 } 
   List<SliderObject>_getSliderData()=>[
             SliderObject(AppStrings.onBoardingTitle1, 
             AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),

             SliderObject(AppStrings.onBoardingTitle2,
              AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),

             SliderObject(AppStrings.onBoardingTitle3,
              AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),

             SliderObject(AppStrings.onBoardingTitle4,
              AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),

    ];
    
}

// ignore: camel_case_types
abstract class  onBoardingViewModelInput{
int getNext();
int goPrevious();
void onPageChange(int index);

Sink get inputSliderViewObject;


}

// ignore: camel_case_types
abstract class  onBoardingViewModelOutput{
  Stream<SliderViewObject> get outputSliderViewObject;


}
