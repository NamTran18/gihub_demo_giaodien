import 'package:bai3/src/blocs/login_bloc.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Loginbloc bloc = Loginbloc();

  bool _ShowPass = false;
  TextEditingController _usercontroller = TextEditingController();
  TextEditingController _passcontroller = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0,40),
                child: Container(
                  width: 70,
                  height:70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffd8d8d8),
                  ),
                  child: FlutterLogo()
                  ),
              ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text('Hello\nWelcome Back',
                  style: TextStyle(
                    fontSize:30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) {
                    return TextField(
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      controller: _usercontroller,
                      decoration: InputDecoration(
                        labelText: "USENAME",
                        errorText: snapshot.hasError? snapshot.error.toString() : null,
                        labelStyle: TextStyle(
                          color:Color(0xff888888),
                          fontSize: 18,)
                        ),
                      );
                  }
                ),
              ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children:[
                      StreamBuilder(
                        stream: bloc.passStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            controller: _passcontroller,
                            obscureText: !_ShowPass, 
                            decoration: InputDecoration(
                              labelText: "PASSWORD",
                              errorText: snapshot.hasError? snapshot.error.toString() : null,
                              labelStyle: TextStyle(
                                color:Color(0xff888888),
                                fontSize: 18,)
                              ),
                            );
                        }
                      ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text( _ShowPass?'HIDE' :'SHOW',
                    style: TextStyle(
                      fontSize:15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)
                      ),
                  ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0 ),
                  child: SizedBox(
                    width: double.infinity,
                    height:50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                      color: Colors.blue,
                      onPressed: clickbutton,
                      child: Text('SIGN IN',style:TextStyle(color: Colors.white,fontSize: 16)),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("NEW USER? SIGN UP",
                      style: TextStyle(fontSize: 15,color: Color(0xff888888)),),
                      Text("FORGOT PASSWORD",
                      style: TextStyle(fontSize: 15,color: Colors.blue,),)
                      
                    ],
                  ),
                )
            ],
          ),
        ),
      );

  }
  void onToggleShowPass(){
    setState(() {
      _ShowPass = !_ShowPass;
    });
  }
  void clickbutton(){
    if(bloc.isValidInfo(_usercontroller.text,_passcontroller.text)){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Myhome()));
    }      
  }
}