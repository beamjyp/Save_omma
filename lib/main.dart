import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'regis.dart';
import 'user_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes',
    initialRoute: '/',
    routes: {'/': (context) => MyApp()},
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => CounterProvider(counter: 0),
        child: MyHomePage(title: "My Home"),
      ),
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
  final idController = TextEditingController();
  final dateController = TextEditingController();
  TextEditingController _controller;
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Widget build(BuildContext context) {
    CounterProvider counterProvider = Provider.of<CounterProvider>(context);
    TextEditingController idCheckController = TextEditingController();
    TextEditingController passCheckController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Container(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                    'assets/images/logologin.png',
                    width: 120,
                    height: 120,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 30),
                  child: Text(
                    'หญิงตั้งครรภ์',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Mitr',
                    ),
                  )),
              TextFieldContainer(
                child: TextField(
                  controller: idController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.credit_card,
                      color: Colors.black,
                    ),
                    labelStyle: TextStyle(
                        fontSize: 15, color: Colors.black, fontFamily: 'Mitr'),
                    labelText: 'เลขบัตรประชาชน',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              TextFieldContainer(
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    labelStyle: TextStyle(
                        fontSize: 15, color: Colors.black, fontFamily: 'Mitr'),
                    labelText: 'วัน / เดือน / ปีเกิด',
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                  controller: _controller,
                  readOnly: true,
                  onTap: () {
                    showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1980, 1),
                        lastDate: DateTime(2021, 12),
                        builder: (BuildContext context, Widget picker) {
                          return Theme(
                            data: ThemeData.dark().copyWith(
                              colorScheme: ColorScheme.dark(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                surface: Colors.pink,
                                onSurface: Colors.white,
                              ),
                              dialogBackgroundColor: Colors.pink[200],
                            ),
                            child: picker,
                          );
                        }).then((selectedDate) {
                      if (selectedDate != null) {
                        _controller.text =
                            DateFormat("dd / MM / yyyy").format(selectedDate);
                      }
                    });
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return User_page();
                        },
                      ),
                    );
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      child: Center(
                          child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                      ))),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ยังไม่ได้ลงทะเบียน?',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Regis();
                              },
                            ),
                          );
                        },
                        child: Text('ลงทะเบียนที่นี่',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Mitr')))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: child,
    );
  }
}

class CounterProvider with ChangeNotifier {
  int counter;
  CounterProvider({this.counter = 0});
  increment() {
    counter++;
    notifyListeners();
  }
}
