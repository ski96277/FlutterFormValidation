import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;

import 'MyTextFormFieldClass.dart';

var firstName="";
var lastName="";
var email="";
var password="";
var confirmPassword="";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Form validation")),
      body: TestForm(),
    ));
  }
}

class TestForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: halfMediaWidth,
                child: MyTextFormField(
                  hintText: "First Name",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter your first name ";
                    }
                    _formKey.currentState.save();
                    return null;
                  },
                  onSaved: (String value){
                    firstName=value;
                  },
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: halfMediaWidth,
                child: MyTextFormField(
                  hintText: "Last Name",
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Enter your last name ";
                    }
                    _formKey.currentState.save();

                    return null;
                  },
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth * 2.0,
            child: MyTextFormField(
              hintText: "Email",
              isEmail: true,
              validator: (String value) {
              if (!validator.isEmail(value)) {
                return "Enter your valid Email ";
              }
              _formKey.currentState.save();

              return null;
            },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth * 2.0,
            child: MyTextFormField(
              hintText: "Password",
              isPassword: true,
              validator: (String value) {
              if (value.isEmpty) {
                return "Enter your password ";
              }
              _formKey.currentState.save();

              return null;
            },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth * 2.0,
            child: MyTextFormField(
              hintText: "Confirm Password",
              isPassword: true,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Confirm your password ";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth * 2.0,
            child: RaisedButton(
              color: Colors.amber,
              child: Text(
                "SignUp",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print("SignUp = $firstName");

                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

