import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_article/bean/article_bean.dart';
import 'package:one_article/network/api.dart';
import 'package:one_article/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 3), () => toHome(null));
    Article.today().then((article) {
      toHome(article);
    }).catchError((e) {
      toHome(null);
    });
  }

  void toHome(ArticleBean article) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(article)));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        color: Colors.blue,
        child: Center(
          child: Image(image: AssetImage('assets/images/splash.png')),
        ),
      );
    });
  }
}