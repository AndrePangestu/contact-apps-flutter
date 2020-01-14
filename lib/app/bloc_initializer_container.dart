import 'package:contact_apps_flutter/features/app_main/presentation/bloc/bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_detail_bloc.dart';
import 'package:contact_apps_flutter/features/contact_list/presentation/bloc/contact_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_apps_flutter/app/injection_container.dart';

class BlocInitializerContainer extends StatefulWidget {
  final Widget child;

  BlocInitializerContainer({
    @required this.child
  });

  @override
  State<StatefulWidget> createState() {
    return _BlocInitializerContainerState();
  }
}

class _BlocInitializerContainerState extends State<BlocInitializerContainer>{

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (_) => sl<BottomNavigationBloc>(),
        ),
        BlocProvider<ContactListBloc>(
          create: (_) => sl<ContactListBloc>(),
        ),
        BlocProvider<ContactDetailBloc>(
          create: (_) => sl<ContactDetailBloc>(),
        )
      ],
      child: widget.child,
    );
  }
}

