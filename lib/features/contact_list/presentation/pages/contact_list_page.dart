import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_list.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListPage extends StatefulWidget {
  static const String routeName = '/contact-list';

  @override
  State<StatefulWidget> createState() {
    return _ContactListPageState();
  }
}

class _ContactListPageState extends State<ContactListPage> {
  ContactListBloc contactListBloc;

  @override
  void initState(){
    super.initState();
    contactListBloc = BlocProvider.of<ContactListBloc>(context);
    contactListBloc.add(FetchContactList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: BlocBuilder<ContactListBloc, ContactListState>(
            builder: (context, state){
              if(state is ContactListLoading){
                return CircularProgressIndicator();
              }
              if(state is ContactListLoaded){
                return Text('LOADED COY');
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}