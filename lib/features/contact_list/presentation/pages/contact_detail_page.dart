import 'package:flutter/cupertino.dart';

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

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('DETAIL');
  }

}