import 'package:bloc_pattern_flutter/HomeActivity/base/BaseEvents.dart';
import 'package:bloc_pattern_flutter/HomeActivity/model/DemoModel.dart';

class DeleteListEvent extends BaseEvents{
  DemoModel demoModel;

  DeleteListEvent(this.demoModel);
}