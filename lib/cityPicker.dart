import 'city.dart' ;

class cityPicker{
  int _city_no = 0;

//  Map <String,String> _cities = {
//    'city_name': 'Addis Ababa',
//  };

  List<City> _cities = [
     City('Addis Ababa',
       [
         27,
         28,
         29,
         25,
         22,
         20,
         19,
       ],
       [
         15,
         16,
         17,
         12,
         11,
         12,
         8,
       ],'img_london.jpg'),
     City('Adama',[
       29,
       31,
       31,
       32,
       35,
       26,
       28,
     ],
       [
         17,
         19,
         18,
         18,
         16,
         15,
         14,
       ],'img_mountains.jpg'),
     City('BahirDar',[
       19,
       20,
       21,
       22,
       18,
       17,
       18,
     ],
       [
         9,
         10,
         11,
         12,
         11,
         13,
         10,
       ],'lake.jpg'),
     City('Hawwasa',[
       29,
       30,
       31,
       32,
       35,
       33,
       30,
     ],[
       20,
       20,
       21,
       22,
       19,
       18,
       20,
     ],'ocean.jpg'),
  ];

  String getCityName(){
    return _cities[_city_no].cityname;
  }
  List getHighTemps(){
    return _cities[_city_no].HighTemp;
  }
  List getLowTemps(){
    return _cities[_city_no].LowTemp;
  }
  String getImage(){
    return _cities[_city_no].ImageName;
  }
  void nextCity(){
    if(_city_no < _cities.length - 1){
      _city_no++;
    }
    else{
      resetCity();
    }


  }
  List allCityNames(){
    List cityNames =[];
    for(int i=0;i<_cities.length;i++){
      cityNames.add(_cities[i].cityname);
    }
    return cityNames;
  }
  void preciousCity(){
    if(_city_no > 0){
      _city_no--;
    }
    else{
      _city_no = _cities.length - 1;
    }
  }
  int no_of_cities(){
    return _cities.length;
  }
  void resetCity(){
    _city_no = 0;
  }
}
