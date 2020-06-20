import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "home",
        //名为"/"的路由作为应用的home(首页)
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //注册路由表
        routes: {
          "new_page": (context) => NewRoute(),
          "home": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
          //注册首页路由
          "tip2": (context) =>
              TipRoute(text: ModalRoute
                  .of(context)
                  .settings
                  .arguments),
        },
        //MaterialApp有一个onGenerateRoute属性，它在打开命名路由时可能会被调用，之所以说可能，是因为当调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由。
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (context) {
            String routeName = settings.name;
            print(routeName);
            return RouterTestRoute();
          });
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
//                //导航到新路由
                Navigator.pushNamed(context, 'test');
//
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  NewRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   //获取路由携带的参数
    var args=ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body:Center(
        child: RaisedButton(
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
            var result = await Navigator.pushNamed(context, "tip2",arguments:"我是提示xxxx");
//            var result = await Navigator.push(
//              context,
//              MaterialPageRoute(
//                builder: (context) {
//                  return TipRoute(
//                    // 路由参数
//                    text: "我是提示xxxx",
//                  );
//                },
//              ),
//            );
            //输出`TipRoute`路由返回结果
            print("路由返回值: $result");
          },
          child: Text("打开提示页"),
        ),
      )
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}