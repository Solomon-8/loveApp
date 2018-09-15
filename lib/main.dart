import 'dart:async';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
void main() => runApp(new MyApp());
AudioCache audioCache = new AudioCache(prefix: "audio/");
AudioPlayer audioPlayer = new AudioPlayer();
class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            home: new MyHomePage(),
        );
    }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    static double width = 240.0;
    static double height = 165.0;
    static List<ExitClass> exitMsg = new List();
    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        exitMsg.add(new ExitClass(0, "就打算这么离开了吗？", "我不！"));
        exitMsg.add(new ExitClass(1, "期待再一次见到你。", "见你的大头？"));
        exitMsg.add(new ExitClass(2, "你今天好奇怪啊！", "怪可爱的。"));
        exitMsg.add(new ExitClass(3, "你猜我想喝什么？", "我想呵护你。"));
        exitMsg.add(new ExitClass(4, "你属什么？", "你属于我。"));
        exitMsg.add(new ExitClass(5, "近朱者赤", "近你者甜"));
        exitMsg.add(new ExitClass(6, "你是哪里人？", "是我的心上人。"));
        exitMsg.add(new ExitClass(7, "你猜我爱喝酒还是爱打王者", "不，爱你"));
        exitMsg.add(new ExitClass(8, "情话是我抄的", "但只说给你听是真的"));
        exitMsg.add(new ExitClass(9, "我有一个超能力", "超喜欢你"));
        exitMsg.add(new ExitClass(10, "可以帮我洗个东西吗？", "喜欢我"));
    }
    @override
    Widget build(BuildContext context) {
        // This method is rerun every time setState is called, for instance as done
        // by the _incrementCounter method above.
        //
        // The Flutter framework has been optimized to make rerunning build methods
        // fast, so that you can just rebuild anything that needs updating rather
        // than having to individually change instances of widgets.
        return new WillPopScope(
            child: new Scaffold(
                    body: new Stack(
                        children: <Widget>[
                            new Opacity(
                                opacity: 1.0,
                                child: new Container(
                                    decoration: new BoxDecoration(image: new DecorationImage(image: new ExactAssetImage("audio/loveBackground.jpg"))),
                                ),
                            ),
                            new Center(
                                child: new Column(
                                    children: <Widget>[
                                        new SizedBox(height: 128.0,),
                                        new Text(
                                            "其实说来话长，就是做我女朋友好吗？",
                                            style: new TextStyle(fontSize: 20.0,color: Colors.white70,fontStyle: FontStyle.italic),
                                        ),
                                        new SizedBox(height: 10.0,),
                                        new Row(
                                            children: <Widget>[
                                                new SizedBox(width: 68.0,),
                                                new FlatButton(
                                                        onPressed: (){
                                                            showDialog(context: context,builder: (BuildContext context) => success());},
                                                        child: new Text("好",style: new TextStyle(fontSize: 17.5,color: Colors.white))
                                                )
                                            ],
                                        )
                                    ],
                                ),
                            ),
                            new GestureDetector(
                                    onTap: ()async {
                                        await tess(context);
                                    },
                                    child: new Column(
                                        children: <Widget>[
                                            new SizedBox(height: height,),
                                            new Row(
                                                children: <Widget>[
                                                    new SizedBox(width: width,),
                                                    new FlatButton(
                                                        onPressed: null,
                                                        child: new Text("不好",style: new TextStyle(fontSize: 17.5,color: Colors.white),),
//                                                    disabledColor: Colors.black,
                                                    ),
                                                ],
                                            )
                                        ],
                                    )
                            )
                        ],
                    )
            ),
            onWillPop: (){
                showDialog(context: context,builder: (BuildContext context) =>
                        dialog()
                );},
        );
    }

    AlertDialog dialog(){
        print(exitMsg.length);
        int index = Random.secure().nextInt(exitMsg.length);
        print(index);
        print(exitMsg);
        return new AlertDialog(
            content: new Text(exitMsg[index].content),
            actions: <Widget>[
                new FlatButton(onPressed: (){Navigator.pop(context);}, child: new Center(child: new Text(exitMsg[index].answer)))
            ],
        );
    }

    AlertDialog success(){
        print("sd1515kl");
        return new AlertDialog(
            content: new Text("余生请多指教"),
            actions: <Widget>[
                new FlatButton(onPressed: (){Navigator.pop(context);}, child: new Center(child: new Text("很高兴能认识你")))
            ],
        );
    }

    Future tess(BuildContext context)async {
//        audioCache.play("allofyou.mp3");
        int a = await audioPlayer.play("http://61.147.122.3/mp32.9ku.com/upload/2017/06/05/862051.m4a",isLocal: false,volume: 80.0);
        setState(() {
            // update the text
            width = Random.secure().nextDouble() * (getScreenWidth(context) - 100);
            height = Random.secure().nextDouble() * (getScreenHeight(context) - 150);
        });
    }

    /** 获取屏幕宽度 */
    static double getScreenWidth(BuildContext context) {
        return MediaQuery.of(context).size.width;
    }

    /** 获取屏幕高度 */
    static double getScreenHeight(BuildContext context) {
        return MediaQuery.of(context).size.height;
    }

    /** 获取系统状态栏高度 */
    static double getSysStatsHeight(BuildContext context) {
        return MediaQuery.of(context).padding.top;
    }

}


class ExitClass{
    int id;
    String content;
    String answer;

    ExitClass(this.id, this.content, this.answer);



}
