import 'package:contact_apps_flutter/features/app_main/presentation/pages/main_page.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/pages/contact_detail_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routers {
  static Router router = Router();
  static const String INITIAL_ROUTE = MainPage.routeName;

  static void setupRouter() {
    router.define(
      MainPage.routeName,
      handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) => MainPage()
      ),
    );
    router.define(
      '${ContactDetailPage.routeName}/:contactId',
      handler: Handler(
          handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
              ContactDetailPage(
                contactId: params["contactId"][0],
              )
      ),
    );
  }

  static Route<dynamic> handleOnUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) {
          return Center(
            child: Container(
              child: Text('PAGE NOT FOUND'),
            ),
          );
        }
    );
  }

}