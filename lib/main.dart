import 'package:bloc_pattern_flutter/HomeActivity/blocs/HomeActivityBloc.dart';
import 'package:bloc_pattern_flutter/HomeActivity/database/DatabaseHepler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomeActivity/HomeActivity.dart';

void main() async{
  runApp(MyApp());
  await DatabaseHepler.instance.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Provider<HomeActivityBloc>.value(
        value: HomeActivityBloc(),
        child: HomeActivity(),
      ),
    );
  }
}
