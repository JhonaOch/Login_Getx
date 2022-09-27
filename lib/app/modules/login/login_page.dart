import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/app/modules/login/login_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_)=>
       Scaffold(
        body: GestureDetector(
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
        
                TextField(
                  onChanged: _.onUsernameChange,
                  keyboardType: TextInputType.emailAddress,
                   decoration: const InputDecoration(
        
                    labelText: "username"
                   )
                ),
                 TextField(
                   onChanged: _.onPasswordChange,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "password"
                  ),
                 ),

                 ElevatedButton(
                  onPressed: (){
                    _.submit();
                  },
               
                  child: 
                  
                  const Text('Send'))
        
        
              ],
            ),
          ),
        ),
       ));
  }
}