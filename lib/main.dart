import 'package:fllutter_learn/core/network/dio_client.dart';
import 'package:fllutter_learn/screens/login/login_screen.dart';
import 'package:fllutter_learn/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:fllutter_learn/screens/document/document_pages.dart';
import 'package:fllutter_learn/screens/setting_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fllutter_learn/blocs/bloc/login/login_bloc.dart';


void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(DioClient()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home:LoginScreen(title: 'AI Doc Cloud'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  //  required this.title
  // final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DocumentPages(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('title'),
      // ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search),
          //   label: 'Business',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

