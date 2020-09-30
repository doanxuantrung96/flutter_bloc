import 'package:bloc_pattern_flutter/HomeActivity/base/BaseEvents.dart';

class AddListEvent extends BaseEvents{
  String title;

  AddListEvent(this.title);
}