import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p8app_flutter/lang/localizations.dart';

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 32.0)),
          new GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                new MaterialPageRoute<bool>(
                  fullscreenDialog: true,
                  builder: (BuildContext context) => new SignDialog(),
                ),
              );
            },
            child: new Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                  bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                ),
              ),
              height: 44.0,
              child: new Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: new SafeArea(
                  top: false,
                  bottom: false,
                  child: new Row(
                    children: <Widget>[
                      Text(CustomLocalizations.of(context).signIn,
                          style: TextStyle(color: Colors.blue))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new MaterialButton(
          child: const Text('Cancel'),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              CupertinoIcons.profile_circled,
              size: 160.0,
              color: Color(0xFF646464),
            ),
            const Padding(padding: EdgeInsets.only(top: 18.0)),
            new MaterialButton(
              child: Text(CustomLocalizations.of(context).signIn),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
