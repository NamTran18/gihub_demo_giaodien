import 'dart:async';

import 'package:bai3/src/validator/validations.dart';

class Loginbloc{
  StreamController _userController = StreamController();
  StreamController _passController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username,String pass){
    if(!Valitions.isValidUser(username)){
      _userController.sink.addError('tài khoản không chính xác');

      return false;
    }
     _userController.add('OK');
    if(!Valitions.isValidPass(pass)){
      _passController.sink.addError('mật khẩu phải trên 6 khí tự');
      return false;
    }
    _passController.add('OK');


    return true;
    
  } 

  void dispose(){
    _userController.close();
    _passController.close();
  }
}