import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p8app_flutter/lang/localizations.dart';

class RefreshControlDemo extends StatefulWidget {
  static const String routeName = '/refresh';

  const RefreshControlDemo();

  @override
  RefreshControlDemoState createState() => RefreshControlDemoState();
}

class RefreshControlDemoState extends State<RefreshControlDemo> {
  ScrollController _controller = new ScrollController();
  static const listCount = 20;
  bool loadingMore = false;
  var randomList = List<int>.generate(listCount, (i) => i + 1);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset);
      print(_controller.position.maxScrollExtent);
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 30) {
        getMoreData();
      }
    });
  }

  Future<Null> getMoreData() async {
    if (loadingMore) return null;
    setState(() {
      loadingMore = true;
    });
    await Future.delayed(Duration(seconds: 3), () {
      print("开始加载更多");
      setState(() {
        loadingMore = false;
        randomList.addAll(List<int>.generate(listCount, (i) => i + 1));
      });
    });
  }

  Future<bool> _onWillPop() async {
    _showDemoDialog(context: context);
    return false;
  }

  Future<void> _showDemoDialog<T>({BuildContext context}) async {
    final value = await showDialog<T>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          CustomLocalizations.of(context).dialogTitle,
        ),
        actions: [
          FlatButton(
            child: Text(CustomLocalizations.of(context).dialogCanncel),
            onPressed: () {
              Navigator.of(context).pop("");
            },
          ),
          FlatButton(
            child: Text(CustomLocalizations.of(context).dialogConfirm),
            onPressed: () {
              Navigator.of(context)
                ..pop()
                ..pop(CustomLocalizations.of(context).dialogConfirm);
            },
          )
        ],
      ),
    );
    // The value passed to Navigator.pop() or null.
    if (value != null && value is String) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(value),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var children = [];
    if (loadingMore) {
      children.add(CupertinoActivityIndicator(
        radius: 20,
      ));
    }
    String obj = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(
                CustomLocalizations.of(context).refresh,
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: new RefreshIndicator(
              child: Column(
                children: [
                  Text(CustomLocalizations.of(context).tip + obj),
                  Flexible(
                    child: ListView.builder(
                        itemCount: randomList.length,
                        itemExtent: 50.0,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).pop(
                                  "${CustomLocalizations.of(context).selected}${index}");
                            },
                            title: Text("$index"),
                          );
                        }),
                  ),
                  ...children
                ],
              ),
              onRefresh: () {
                return Future<void>.delayed(const Duration(seconds: 1))
                  ..then<void>((_) {
                    if (mounted) {
                      setState(() {
                        randomList =
                            List<int>.generate(listCount, (i) => i + 1);
                      });
                    }
                  });
              },
            )));
  }
}

// END
