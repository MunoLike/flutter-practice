import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = <Tab>[
    Tab(
      text: 'One',
      icon: Icon(Icons.android),
    ),
    Tab(
      text: 'Two',
      icon: Icon(Icons.info),
    ),
    Tab(
      text: 'Three',
      icon: Icon(Icons.home),
    ),
  ];

  late TabController _tabController;

  static var _items = <Widget>[];
  static var _message = 'ok.';
  static var _tapped = 0;

  static var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    for(var i = 0;i<5;i++){
      var item = ListTile(
        leading: const Icon(Icons.android),
        title: TextField(
          controller: _controller,
          style: TextStyle(fontSize: 20),
        ),
        onTap: (){
          _tapped = i;
          tapItem();
        },
      );
      _items.add(item);
    }

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      bottomNavigationBar: Container(
          color: Colors.blue,
          child: TabBar(
            tabs: tabs,
            controller: _tabController,
          )),
      body: new TabBarView(
        children: tabs.map((e) => createTab(e)).toList(),
        controller: _tabController,
      ),

      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: _items,
        ),
      ),
    );
  }

  void tapItem(){
    Navigator.pop(context);
    setState(() {
      _message='tapped: [$_tapped]';
    });
  }

  Widget createTab(Tab tab) {
    return Center(
      child: Text(
        'This is ${tab.text} Tab '+_message,
        style: const TextStyle(fontSize: 32, color: Colors.blue),
      ),
    );
  }
}
