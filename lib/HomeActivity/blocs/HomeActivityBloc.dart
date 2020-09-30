import 'dart:async';
import 'dart:math';
import 'package:bloc_pattern_flutter/HomeActivity/base/BaseBlocs.dart';
import 'package:bloc_pattern_flutter/HomeActivity/base/BaseEvents.dart';
import 'package:bloc_pattern_flutter/HomeActivity/database/ListTable.dart';
import 'package:bloc_pattern_flutter/HomeActivity/events/AddListEvent.dart';
import 'package:bloc_pattern_flutter/HomeActivity/events/DeleteListEvent.dart';
import 'package:bloc_pattern_flutter/HomeActivity/model/DemoModel.dart';

class HomeActivityBloc extends BaseBlocs{
  var random = Random();

  StreamController<List<DemoModel>> _listDemoCtrl = StreamController<List<DemoModel>>();

  Stream<List<DemoModel>> get listDemoStream => _listDemoCtrl.stream;

  List<DemoModel> _listDemo = List<DemoModel>();

  ListTable _listTable = ListTable();

  initData() async{
    _listDemo = await _listTable.selectAll();
    // if(_listDemo == null){
    //   return;
    // }else{
      _listDemoCtrl.sink.add(_listDemo);
    // }
  }

  _addListDemo(DemoModel demoModel) async{
    await _listTable.insertData(demoModel);

    _listDemo.add(demoModel);
    _listDemoCtrl.sink.add(_listDemo);
  }
  _deleteDemo(DemoModel demoModel) async{
    await _listTable.deleteData(demoModel);

    _listDemo.remove(demoModel);
    _listDemoCtrl.sink.add(_listDemo);
  }

  @override
  void dispatchEvent(BaseEvents events) {
    if(events is AddListEvent){
      DemoModel demoModel = new DemoModel(random.nextInt(1000),events.title);
      _addListDemo(demoModel);
    }else if(events is DeleteListEvent){
      _deleteDemo(events.demoModel);
    }
  }

  @override
  void dispose() {
    _listDemoCtrl.close();
    super.dispose();
  }
}