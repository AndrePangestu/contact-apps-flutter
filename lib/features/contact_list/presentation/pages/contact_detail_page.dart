import 'package:contact_apps_flutter/features/contact_list/domain/entities/contact_list_item_entity.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_event.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailPage extends StatefulWidget{
  static const String routeName = '/contact-detail';

  final String contactId;

  ContactDetailPage({
    this.contactId
  });

  @override
  State<StatefulWidget> createState() {
    return _ContactDetailPageState();
  }
}

class _ContactDetailPageState extends State<ContactDetailPage>{
  ContactDetailBloc contactDetailBloc;

  @override
  void initState(){
    super.initState();
    contactDetailBloc = BlocProvider.of<ContactDetailBloc>(context);
    contactDetailBloc.add(FetchContactDetail(
      widget.contactId
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Detail'),
      ),
      body: Container(
        child: BlocBuilder<ContactDetailBloc, ContactDetailState>(
          bloc: contactDetailBloc,
          builder: (context, state){
            if(state is ContactDetailLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is ContactDetailLoaded){
              return Center(
                child: renderContactView(state.contactListItemEntity),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget renderContactView(ContactListItemEntity items){
    return Container(
      height: 300.0,
      child: Column(
        children: <Widget>[
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                      child: Container(
                        child: Image.network(
                          items.photo
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                      child: Container(
                        child: Text('Name : ${items.firstName} ${items.lastName}'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                      child: Container(
                        child: Text('Age : ${items.age}'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              child: Text('Get Direction Recommended'),
              onPressed: () {
                getDirectionMap();
              },
            ),
          )
        ],
      )
    );
  }

  void getDirectionMap() async{

//    final url = 'https://www.google.com/maps/dir/api=1&';
    final url = "https://goo.gl/maps/8WusxSjroHLSUXes8";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }

}