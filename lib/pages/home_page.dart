import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p8app_flutter/common/image.dart';
import 'package:p8app_flutter/lang/localizations.dart';
import 'package:p8app_flutter/pages/list_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var titles = <String>[
      CustomLocalizations.of(context).test + '1',
      CustomLocalizations.of(context).test + '2',
      CustomLocalizations.of(context).test + '3',
      CustomLocalizations.of(context).test + '4',
      CustomLocalizations.of(context).test + '5',
      CustomLocalizations.of(context).test + '6',
      CustomLocalizations.of(context).test + '8',
      CustomLocalizations.of(context).test + '9',
      CustomLocalizations.of(context).test + '10',
    ];
    return DefaultTabController(
        length: titles.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 55,
            elevation: 0.0,
            bottom: TabBar(
                isScrollable: true,
                tabs: titles.map((String title) {
                  return Tab(
                    text: title,
                  );
                }).toList()),
          ),
          body: TabBarView(
              children: titles.map((String title) {
            return Material(
              child: title.contains('1')
                  ? FirstPage()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'MedLinc Demo',
                          style: TextStyle(
                              color: Color(0xff70c2F0),
                              fontWeight: FontWeight.bold,
                              fontSize: 26.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                        ),
                        Image.asset(Images.flutterIcon)
                      ],
                    ),
            );
          }).toList()),
        ));
  }
}

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstPageSate();
  }
}

class FirstPageSate extends State<FirstPage> {
  var result = null;

  @override
  Widget build(BuildContext context) {
    var children = [];
    if (result != null) {
      children.add(Text('返回参数： ${result}'));
    }
    return Column(
      children: [
        RaisedButton(
          child: Text(CustomLocalizations.of(context).jump),
          onPressed: () async {
            var data = await Navigator.pushNamed(
                context, RefreshControlDemo.routeName,
                arguments: "首页传递的数据");
            setState(() {
              print(data);
              result = data;
            }); // Perform some action
          },
        ),
        ...children
      ],
    );
  }
}
