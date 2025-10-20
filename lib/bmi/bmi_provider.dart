import 'package:bmi_calculate_app/bmi/constants.dart';
import 'package:flutter/cupertino.dart';

class BmiProvider with ChangeNotifier{
  double _weight = 0.0;
  double _heigth = 0.0;
  double _bmi = 0.0;
  String _bmiStatus = 'Undefine';

  double get widgth => _weight;

  double get heigth => _heigth;

  double get bmi => _bmi;

  String get bmiStatus => _bmiStatus;


  void calculateBmi(String w, String h){
    _bmi = double.parse(w)/(double.parse(h) * double.parse(h));
    _generateStatus();
    notifyListeners();
  }
  void _generateStatus(){
    if(_bmi <16.0){
      _bmiStatus =underwightSavre;
    }else if(_bmi >= 16.0 && _bmi<16.9){
      _bmiStatus = underwightModarate;
    }else if(_bmi >= 17.0 && _bmi<18.4){
      _bmiStatus = underwightMidle;
    }else if(_bmi >= 18.5 && _bmi<24.9){
      _bmiStatus = normal;
    }else if(_bmi >= 25.0 && _bmi<29.9){
      _bmiStatus = overweightPreObese;
    }else if(_bmi >= 30.0 && _bmi<34.9){
      _bmiStatus = overweightPreObese1;
    }else if(_bmi >= 35.0 && _bmi<39.9){
      _bmiStatus = overweightPreObese2;
    }else{
      _bmiStatus = overweightPreObese3;
    }


  }

}