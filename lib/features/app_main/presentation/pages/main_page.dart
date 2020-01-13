import 'package:contact_apps_flutter/features/contact_list/presentation/pages/contact_list_page.dart';
import 'package:contact_apps_flutter/features/contact_maps/presentation/pages/contact_maps_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_apps_flutter/features/app_main/presentation/bloc/bloc.dart';

class MainPage extends StatefulWidget{
  static const String routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage>{
  BottomNavigationBloc bottomNavigationBloc;

  @override
  void initState(){
    super.initState();
    bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    bottomNavigationBloc.add(PageTapped(
      index: 0
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return WillPopScope(
        onWillPop: null,
        child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          bloc: bottomNavigationBloc,
          builder: (BuildContext context, BottomNavigationState state){
            if(state is PageLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is ContactListPageLoaded){
              return ContactListPage();
            }
            if(state is ContactMapsPageLoaded){
              return ContactMapsPage();
            }
            return Container();
          }
        )
    );
  }

  Widget buildBottomNavigationBar() {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: bottomNavigationBloc,
      builder: (BuildContext context, BottomNavigationState state){
        return BottomNavigationBar(
          currentIndex: bottomNavigationBloc.currentIndex,
          onTap: (index) => _handleBottomNavigationTap(index),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.contacts,
                color: Colors.black,
              ),
              title: Text(
                  'Contact List'
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: Colors.black,
              ),
              title: Text(
                  'Contact Maps'
              ),
            ),
          ],
        );
      }
    );
  }

  _handleBottomNavigationTap(int index){
    bottomNavigationBloc.add(
      PageTapped(
        index: index
      )
    );
  }


}

