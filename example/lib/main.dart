
import 'package:flutter/material.dart';
import 'package:indicator_navbar/indicator_navbar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light
        // primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: TabsScreen(),
    );
  }
}

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var init = true;
  List<Map<String, Object>> _pages = [
    {
      'page': Scaffold(),
      'title': 'Page1',
    },
    {
      'page': Scaffold(),
      'title': 'Page2',
    },
    {
      'page': Scaffold(),
      'title': 'Page3',
    },
    {
      'page': Scaffold(),
      'title': 'Page4',
    },
    {
      'page': Scaffold(),
      'title': 'Page5',
    },
  ];
  var _pageSelector = 0;

  @override
  void initState() {
    super.initState();
  }


  void _selectPage(int index) {
    setState(() {
      _pageSelector = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_pageSelector]['title'] as String,
        ),
        shape: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 0.1,
          ),
        ),
        elevation: 0,
      ),
      body: _pages[_pageSelector]['page'] as Widget,
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)
        ,onPressed: () {  },),

      //
      // This is the bottom navigator bar
      //
      bottomNavigationBar: CustomBottomIndicatorBar(
        onTap: _selectPage,
        currentIndex: _pageSelector,
        shadow: true,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        // backgroundColor: Colors.orange,
        // activeColor: Colors.yellow,
        // selectedIconTheme: IconThemeData(color: Colors.teal),
        // unselectedIconTheme: IconThemeData(color: Colors.black87),
        // indicatorColor: Colors.cyan,
        // inactiveColor: Colors.brown,
        // selectedLabelStyle: TextStyle(color: Colors.indigoAccent,fontWeight: FontWeight.bold),
        animationDuration: 200,
        // unselectedLabelStyle: TextStyle(color: Colors.purple, fontWeight: FontWeight.normal),
        items: [
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.notifications),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '1',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airport_shuttle_rounded),
            label: 'Transport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Offset',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_rounded),
            label: 'Social',
          ),
        ],
      ),
    );
  }
}