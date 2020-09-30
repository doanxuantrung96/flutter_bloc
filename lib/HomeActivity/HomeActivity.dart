import 'package:bloc_pattern_flutter/HomeActivity/blocs/HomeActivityBloc.dart';
import 'package:bloc_pattern_flutter/HomeActivity/events/AddListEvent.dart';
import 'package:bloc_pattern_flutter/HomeActivity/events/DeleteListEvent.dart';
import 'package:bloc_pattern_flutter/HomeActivity/model/DemoModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeActivityState();
  }
}

class HomeActivityState extends State<HomeActivity> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _edtCtrName = TextEditingController();
    var _bloc = Provider.of<HomeActivityBloc>(context);

    _bloc.initData();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(
                left: 15.0, right: 15.0, top: 30.0, bottom: 4.0),
            decoration: new BoxDecoration(
                color: Colors.black12,
                border: new Border.all(width: 1.2, color: Colors.black),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(4.0))),
            child: TextField(
              controller: _edtCtrName,
              decoration: new InputDecoration(
                hintText: 'Tên nhân viên',
                contentPadding: new EdgeInsets.all(10.0),
                border: InputBorder.none,
              ),
              autocorrect: false,
            ),
          ),
          new RaisedButton(
            onPressed: () => _bloc.event.add(AddListEvent(_edtCtrName.text)),
            textColor: Colors.white,
            color: Colors.cyan,
            child: const Text('Thêm', style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: Container(
              child: Consumer<HomeActivityBloc>(
                builder: (context, bloc, child) {
                  return StreamBuilder<List<DemoModel>>(
                    stream: _bloc.listDemoStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print(snapshot.data.toString());
                        if(snapshot.data.length > 0){
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                title: Text(snapshot.data[index].title),
                                trailing: GestureDetector(
                                  onTap: () => _bloc.event
                                      .add(DeleteListEvent(snapshot.data[index])),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }else{
                          return Center(
                            child: _loading(),
                          );
                        }
                      } else {
                        return Center(
                          child: _loading(),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _loading(){
    return Container(
        width: 80.0,
        height: 80.0,
        child: CircularProgressIndicator(),
      );
  }
}
