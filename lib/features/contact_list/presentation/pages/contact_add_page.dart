import 'dart:io';

import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ContactAddPage extends StatefulWidget{
  static const String routeName = '/contact-add';

  @override
  State<StatefulWidget> createState() {
    return _ContactAddPageState();
  }
}

class _ContactAddPageState extends State<ContactAddPage>{
  final _formKey = GlobalKey<FormState>();
  File _image;
  String firstName = '';
  String lastName = '';
  int age = 0;
  String photo = '';

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'First Name'
                  ),
                  onSaved: (String value){
                    firstName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input First Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Last Name'
                  ),
                  onSaved: (String value){
                    lastName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input Last Name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Age'
                  ),
                  onSaved: (value){
                    age = int.parse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please input age';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
                child: RaisedButton(
                  child: Text('UPLOAD FOTO'),
                  onPressed: () => getImage(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: _image == null
                    ? Text('No image selected.')
                    : Container(
                  height: 120.0,
                  child: Image.file(_image),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Text('SUBMIT', style: TextStyle(
                    color: Colors.white
                  )),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      submitData();
                    }

                  },
                ),
              )
            ],
          ),
        )
      )
    );
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      photo = image.toString();
    });
    print('_image ${_image}');
  }

  void submitData() {
    print("$firstName, $lastName, $age, $photo");
  }



}