import 'dart:async';

import 'package:contact_apps_flutter/core/presentation/bloc/main_bloc_delegate.dart';
import 'package:contact_apps_flutter/features/contact_maps/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'app/injection_container.dart' as di;
import 'app/app.dart';
import 'app/routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Routers.setupRouter();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runZoned<Future<void>>(() async {
    BlocSupervisor.delegate = MainBlocDelegate();
    runApp(
      App()
    );
  });
}

