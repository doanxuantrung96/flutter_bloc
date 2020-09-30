import 'dart:async';
import 'package:bloc_pattern_flutter/HomeActivity/base/BaseEvents.dart';
import 'package:flutter/material.dart';

abstract class BaseBlocs {
  StreamController<BaseEvents> _eventStreamCtrl =
      StreamController<BaseEvents>();

  Sink<BaseEvents> get event => _eventStreamCtrl.sink;

  BaseBlocs(){
    _eventStreamCtrl.stream.listen((event) {
      if(event is! BaseEvents){
        throw Exception("event not isvalid!");
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvents baseEvents);

  @mustCallSuper
  void dispose(){
    _eventStreamCtrl.close();
  }
}
