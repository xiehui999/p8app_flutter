import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p8app_flutter/common/image.dart';
import 'package:p8app_flutter/lang/localizations.dart';

class Discover extends StatelessWidget {
  final double _appBarHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<String>> _allPages = <String, List<String>>{
      CustomLocalizations.of(context).tabHot: <String>[
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon
      ],
      CustomLocalizations.of(context).tabNew: <String>[
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
        Images.flutterIcon,
      ]
    };

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: Text('Ali Connors'),
                    pinned: true,
                    toolbarHeight: 0,
                    expandedHeight: _appBarHeight,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(tabs: [
                      Tab(
                        text: CustomLocalizations.of(context).tabHot,
                      ),
                      Tab(
                        text: CustomLocalizations.of(context).tabNew,
                      )
                    ]),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.asset(
                            Images.mountain,
                            fit: BoxFit.cover,
                            height: _appBarHeight,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[
                                Color(0x60000000),
                                Color(0x00000000),
                              ],
                                      begin: Alignment(0.0, -1.0),
                                      end: Alignment(0.0, -0.4))))
                        ],
                      ),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(
                children: _allPages.keys.map((String page) {
              return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey(page),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context)),
                        SliverPadding(
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          sliver: SliverFixedExtentList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                final String data = _allPages[page][index];
                                return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Align(
                                              alignment: page ==
                                                      CustomLocalizations.of(
                                                              context)
                                                          .tabHot
                                                  ? Alignment.centerLeft
                                                  : Alignment.centerRight,
                                              child: CircleAvatar(
                                                child: Text('${page}'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 144.0,
                                              height: 144.0,
                                              child: Image.asset(
                                                data,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                data,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ));
                              }, childCount: _allPages[page].length),
                              itemExtent: 302),
                        )
                      ],
                    );
                  }));
            }).toList()),
          ),
        ));
  }
}
