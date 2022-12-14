// ignore_for_file: unused_element

import 'dart:html';

import 'package:first_project/homescreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormBuilderScreen extends StatefulWidget {
  const FormBuilderScreen({super.key});

  @override
  State<FormBuilderScreen> createState() => _FormBuilderScreenState();
}

class _FormBuilderScreenState extends State<FormBuilderScreen> {
final formkey = GlobalKey<FormBuilderState>();
List gender = ["Male","Female","others"];
String? userName;
String? password;
String? genderSelected;
String? dateTime;
String? Slider;
String? email;
String? radioButtons;
String? checkBox;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
child: Column(
          children:[ FormBuilder(
          key: formkey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "User Name",
                decoration: const InputDecoration(
                  hintText: "Enter User Name",labelText: "User Name"),
                  readOnly: false,
                  enabled: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "this feild is required")
                  ]) ,
                  onChanged: (value){
                    setState(() {
                   userName = value;
                   print(userName);

                    });

                  },
                ),
                FormBuilderTextField(
                name: "password",
                decoration: const InputDecoration(
                  hintText: "Enter password",labelText: "password"),
                  readOnly: false,
                  enabled: true,
                  obscureText: true,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "this feild is required")
                  ]) ,
                  onChanged: (value){
                    setState(() {
                    password = value;
                    print(password);

                    });

                  },
                ),

                FormBuilderDropdown(
                  name: "Gender", 
                items: gender
                .map((e)=> 
                DropdownMenuItem(child: Text(e),value: e,))
                .toList(),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "this feild is required")
                  
                ]),
                decoration: const InputDecoration(
                  hintText: "Select Gender", labelText: "gender"
                ),
                onChanged: (newValue){
                  setState(() {
                    genderSelected = newValue.toString();
                  });
                },
                ),
                FormBuilderDateTimePicker(
                  name: "DateTime",
                initialValue: DateTime.now(),
                firstDate: DateTime(2022, 1, 1),
                lastDate: DateTime(2022, 12, 31),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "this field is required"
                  )
                ]),
                decoration: const InputDecoration(
                  hintText: "Select DateTime",labelText: "Datetime"
                ),
                onChanged: (newValue){
                  setState(() {
                    dateTime = newValue.toString();
                  });
                },
                ),
                FormBuilderSlider(
                  name: "Slider", 
                  initialValue: 4,
                   min: 0, 
                   max: 100,
                  divisions: 10,
                  ),
                  FormBuilderTextField(name: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "this field is required"),
                    FormBuilderValidators.email()
                  
                ]),
                decoration: const InputDecoration(
                  hintText: "Enter Email",labelText: "email"
                ),
                onChanged: (newValue){
                  setState(() {
                    email = newValue.toString();
                    print(email);
                  });
                },
                  ),
                  FormBuilderRadioGroup(
                    name: "Radio Buttons", 
                    options: ["Dart","c","c++"]
                    .map((e) => FormBuilderFieldOption(value: e,
                    child: Text(e),
                    ))
                    .toList(),
                    validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "this field is required"),
                    
                  
                ]),
                decoration: const InputDecoration(
                  hintText: "Radio buttons",
                ),
                onChanged: (newValue){
                  setState(() {
                    radioButtons = newValue.toString();
                    print(radioButtons);
                  });
                },
                ),
                FormBuilderCheckbox(name: "Check Box",
                 title: Row( children: [ Text("Agree and Continue"),
                 Text("Terms and Conditions",
                 style: TextStyle(color: Colors.teal),
                 )
                 ]),
                 validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "this field is required"),
                    
                  
                ]),
                decoration: const InputDecoration(
                  hintText: "Check Box",
                ),
                onChanged: (newValue){
                  setState(() {
                    checkBox = newValue.toString();
                    print(checkBox);
                  });
                },
                 )
            ],
          ),
          ),

                SizedBox(
                  height: 20,
                ),
                   ElevatedButton(
                    onPressed: () async {
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                      userName =
                      formkey.currentState!.value["User Name"].toString(); 
                      password =          
                        formkey.currentState!.value["password"].toString();  
                        genderSelected=
                          formkey.currentState!.value["Gender"].toString();  
                        print(userName);
                        print(password);  
                        print(genderSelected);  
                        userInfo(userName!, password!, genderSelected!);
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>HomeScreen(
                            username: userName!, 
                            password: password!, 
                            gender: genderSelected!
                            )));
                         formkey.currentState!.fields["User Name"]!.reset();
                         formkey.currentState!.fields["Password"]!.reset();
                         formkey.currentState!.fields["Gender"]!.reset();
                             }
else{
  print("Error");
}
                  },
                   child: Text("Save Data")),
                
          ],
        ),
            
       ) ),
      );
    
  }
  void userInfo(String username, String password, String genderSelected) async{
  SharedPreferences userPrefs = await SharedPreferences.getInstance();
  userPrefs.setStringList('UserInfo',[username, password, genderSelected]);
   
  
  print(userPrefs.getStringList('UserInfo'));
}
}