import 'package:flutter/material.dart';
import 'package:flutter_news/utils/ToastUtils.dart';
import 'tab/tab_homepage.dart';
import 'tab/tab_communitypage.dart';
import 'tab/tab_minepage.dart';
import 'tab/tab_videopage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _lastPressedAt; //上次点击时间
  var _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter News"),
          centerTitle: true,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("首页")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.video_call), title: new Text("视频")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.all_inclusive), title: new Text("社区")),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.person), title: new Text("我的")),
          ],
          currentIndex: _curIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
        ),
        body: IndexedStack(
          children: <Widget>[
            new TabHomePage(),
            new TabVideoPage(),
            new TabCommunityPage(),
            new TabMinePage()
          ],
          index: _curIndex,
        ),
      ),
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          ToastUtils.showToast("连续点击两次退出应用");
          return false;
        }
        return true;
      },
    );
  }
}
