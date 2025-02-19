// emboarding models
class SliderObject{
  String tittle;
  String subTittle;
  String image;
 
 SliderObject(this.tittle,this.subTittle,this.image);

}

class SliderViewObject{
  SliderViewObject sliderViewObject;
  int numOfSlider;
  int numOfCurrentIndex;

  SliderViewObject(this.sliderViewObject,this.numOfSlider,this.numOfCurrentIndex);

}


//login models
class Customer{
  String id;
  String name;
  int numOfnotifications;
  Customer(this.id,this.name,this.numOfnotifications);

}

class Contacts{
  String phone;
  String email;
  String link;
  Contacts(this.phone,this.email,this.link);  

}

class Authentication{
  Customer ? customer;
  Contacts? contacts;
  Authentication(this.customer,this.contacts);
  
}