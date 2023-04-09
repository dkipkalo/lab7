import 'package:flutter/material.dart';
import 'package:lab4/home_page.dart';
import 'package:lab4/search_page.dart';
import 'package:lab4/toggle_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final themeDark = sharedPreferences.getBool('theme_dark') ?? false;
  runApp(MyApp(themeDark: themeDark));
}

class MyApp extends StatelessWidget {
  final bool themeDark;

  const MyApp({super.key, required this.themeDark});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ToggleTheme(themeDark),
        builder: (context, snapshot) {
          final settings = Provider.of<ToggleTheme>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: settings.currentTheme,
            home: MyStatefulWidget(),
          );
        });
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  void _toggleTheme() {
    final settings = Provider.of<ToggleTheme>(context, listen: false);
    settings.toggleTheme();
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    const Text(
      'notifications',
    ),
    const Text(
      'messages',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.face),
                      Icon(Icons.settings),
                    ],
                  ),
                  const Text("userName"),
                ],
              ),
            ),
            ListTile(
              title: const Text("profile"),
              leading: const Icon(Icons.people),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("theme"),
              leading: const Icon(Icons.message_sharp),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("bookmarks"),
              leading: const Icon(Icons.bookmark),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("lists"),
              leading: const Icon(Icons.list),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("friends"),
              leading: const Icon(Icons.people_alt_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleTheme,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email_outlined, color: Colors.black),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
