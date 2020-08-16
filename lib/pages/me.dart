import 'package:flutter/cupertino.dart';
import 'package:p8app_flutter/lang/localizations.dart';

class Me extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        trailing: null,
      ),
      child: new DecoratedBox(
        decoration: const BoxDecoration(color: Color(0xFFEFEFF4)),
        child: new ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 32.0)),
            new GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  new CupertinoPageRoute<bool>(
                    fullscreenDialog: true,
                    builder: (BuildContext context) => new SignDialog(),
                  ),
                );
              },
              child: new Container(
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(
                    top: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                    bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                  ),
                ),
                height: 44.0,
                child: new Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: new SafeArea(
                    top: false,
                    bottom: false,
                    child: new Row(
                      children: <Widget>[
                        Text(CustomLocalizations.of(context).signIn,
                            style: TextStyle(color: CupertinoColors.activeBlue))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar: new CupertinoNavigationBar(
        leading: new CupertinoButton(
          child: const Text('Cancel'),
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ),
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              CupertinoIcons.profile_circled,
              size: 160.0,
              color: Color(0xFF646464),
            ),
            const Padding(padding: EdgeInsets.only(top: 18.0)),
            new CupertinoButton(
              color: CupertinoColors.activeBlue,
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
