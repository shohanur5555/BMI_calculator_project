import 'dart:math';

import 'package:flutter/foundation.dart';

enum GameStatus{
  win, lose, none
}
class GameProvider with ChangeNotifier{
  GameStatus winingStatus = GameStatus.none;
  final pointList = [100,200,500,1000,2000,5000];


  final _diceList = [
    'assets/dice_image/d1.png',
    'assets/dice_image/d2.png',
    'assets/dice_image/d3.png',
    'assets/dice_image/d4.png',
    'assets/dice_image/d5.png',
    'assets/dice_image/d6.png',

  ];
  int _index1 = 0;
  int _index2 = 0;
  final _random = Random();

  final _winingPoint = 100;
  final _losingPoint = 100;
  final _minPointRequired =100;
  final caseTergetDeductionPoint = 10;

  int _diceSum = 0;
  int _terget = 0;
  int _totalPoint = 0;
  String _status = '';
  bool _isGameOver = false;

  bool get canPlayerPlay => _totalPoint >= _minPointRequired;

  get winingPoint => _winingPoint;

  get losingPoint => _losingPoint;

  get chaseTargetDetuctionlPoint => caseTergetDeductionPoint;

  bool get isGameOver => _isGameOver;

  String get status => _status;

  int get totalPoint => _totalPoint;

  int get terget => _terget;

  int get diceSum => _diceSum;

  String get diceOneImage => _diceList[_index1];
  String get diceTwoImage => _diceList[_index1];

  setInitialPoint(int point){
    _totalPoint =point;
  }

  rollTheDice(){
    _index1 = _random.nextInt(6);
    _index2 = _random.nextInt(6);
    _diceSum = _index1 + _index2 + 2;
    _calculateGameData ();
    notifyListeners();
  }
  void resetGame(){
    _index1 =0;
    _index2 =0;
    _diceSum =0;
    _terget =0;
    _status ='';
    _isGameOver =false;
    winingStatus = GameStatus.none;
    notifyListeners();
  }


  _calculateGameData(){
    if(terget > 0){
      if(_diceSum == 7){
        _status = 'You Lose!';
        _totalPoint -= _losingPoint;
        _isGameOver = true;
        winingStatus = GameStatus.lose;
      }else if(_diceSum == _terget){
        _status = 'You Win';
        _totalPoint += _winingPoint;
        _isGameOver = true;
        winingStatus = GameStatus.win;
      }else {
        _totalPoint -= caseTergetDeductionPoint;
      }
    }else {
      if(_diceSum == 7 || _diceSum == 11){
        _status ='You Win';
        _totalPoint += _winingPoint;
        _isGameOver =true;
        winingStatus = GameStatus.win;
      }else if (_diceSum == 2 || _diceSum == 3 || _diceSum == 12){
        _status = 'You Lose!';
        _totalPoint -= _losingPoint;
        _isGameOver = true;
        winingStatus = GameStatus.lose;
      }else{
        _terget = _diceSum;
      }
    }
  }


}