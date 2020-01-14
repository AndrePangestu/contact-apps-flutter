import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/domain/usecases/get_contact_list.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_state.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/pages/contact_detail_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_add_page.dart';

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
      appBar: AppBar(
        title: Center(
          child: Text('Contact List'),
        ),
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<ContactListBloc, ContactListState>(
            bloc: contactListBloc,
            builder: (context, state){
              if(state is ContactListLoading){
                return CircularProgressIndicator();
              }
              if(state is ContactListLoaded){
                return renderContactListView(state.contactListItemEntity);
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addContact()),
    );
  }

  Widget renderContactListView(List<ContactListItemEntity> items){
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext buildContext, int index) {
          ContactListItemEntity contactListItemEntity = items[index];
          Widget contactCardView = Container(
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8.0),
                onTap: () => this.onTap(contactListItemEntity.id),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                          child: Container(
                            child: Text(contactListItemEntity.firstName),
                          ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );

          return contactCardView;
        }
    );
  }


  void onTap(String contactId){
    print('contactId $contactId');
    Navigator.of(context).pushNamed('${ContactDetailPage.routeName}/$contactId');
  }

  void addContact(){
    Navigator.of(context).pushNamed(ContactAddPage.routeName);
  }
}