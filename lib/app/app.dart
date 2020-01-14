
import 'package:contact_apps_flutter/app/bloc_initializer_container.dart';
import 'package:contact_apps_flutter/features/app_main/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

import 'routers.dart';


class App extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  Routers routers;

  @override
  void initState(){
    super.initState();
    routers.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocInitializerContainer(
      child: MaterialApp(
        title: 'Contact Apps Flutter',
        home: MainPage(),
        initialRoute: Routers.INITIAL_ROUTE,
        onGenerateRoute: routers.router.generator,
        onUnknownRoute: routers.handleOnUnknownRoute,
      ),
    );

  }
}
