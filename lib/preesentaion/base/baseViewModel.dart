// ignore_for_file: file_names

 class BaseViewModel implements BaseViewModelInput , BaseViewModelOutput{
  @override
  void Start() {
    // TODO: implement Start
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
  }

}

abstract class BaseViewModelInput{

  void Start();
  void dispose();

}

abstract class BaseViewModelOutput{
 
}



