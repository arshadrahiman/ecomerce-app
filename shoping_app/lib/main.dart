import 'package:flutter/material.dart';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:shoping_app/bottomNavigation.dart';
import 'package:shoping_app/crud/add_or_edit_employee_screen.dart';
import 'package:shoping_app/crud/employee.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(EmployeeAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hexeam',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.asset(
            'assets/appbar_image.jpg',
            fit: BoxFit.contain,
            height: 55,
          ),
        ]),
        actions: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 40,
                width: 50,
                child: Stack(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        " Menu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 50,
                      height: 50,
                      top: 6.0,
                      right: 11.5,
                      child: IconButton(
                        icon: Image.asset(
                          'assets/menu_icon.png',
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      AddOrEditEmployeeScreen(false)));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: MyNavigationBar(),
    );
  }
}
