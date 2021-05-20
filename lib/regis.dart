import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class Regis extends StatefulWidget {
  Regis({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Regis createState() => _Regis();
}

class _Regis extends State<Regis> {
  int _value = 1;
  int _radioValue = 0;
  int _radioValuemap = 0;
  final int _fields = 20;
  List<TextEditingController> controllers;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  void _handleRadioValueChangemap(int value) {
    setState(() {
      _radioValuemap = value;

      switch (_radioValuemap) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllers = List.generate(_fields, (i) => TextEditingController());
  }

  @override
  void dispose() {
    controllers.forEach((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.pink[200],
      width: double.infinity,
      height: size.height,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Text(
                  'ลงทะเบียนแม่',
                  style: TextStyle(fontSize: 20, fontFamily: 'Mitr'),
                ),
                SizedBox(
                  height: 30,
                ),
                Getfield(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'สัญชาติไทย',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      Text(
                        'ไม่ใช่สัญชาติไทย',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                      ),
                    ],
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'เลขบัตรประชาชน',
                    ),
                    showCursor: false,
                    controller: controllers[1],
                    onChanged: (value) {
                      final controller = controllers[1];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'คำนำหน้าชื่อ',
                    ),
                    showCursor: false,
                    controller: controllers[2],
                    onChanged: (value) {
                      final controller = controllers[2];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'ชื่อ',
                    ),
                    showCursor: false,
                    controller: controllers[3],
                    onChanged: (value) {
                      final controller = controllers[3];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.people_alt_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'นามสกุล',
                    ),
                    showCursor: false,
                    controller: controllers[4],
                    onChanged: (value) {
                      final controller = controllers[4];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'วัน / เดือน / ปีเกิด',
                    ),
                    cursorColor: Colors.black,
                    controller: controllers[5],
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
                          controllers[5].text =
                              DateFormat("dd / MM / yyyy").format(selectedDate);
                        }
                      });
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'หมายเลขโทรศัพท์',
                    ),
                    showCursor: false,
                    controller: controllers[6],
                    onChanged: (value) {
                      final controller = controllers[6];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.chat_bubble,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'Line-ID',
                    ),
                    showCursor: false,
                    controller: controllers[7],
                    onChanged: (value) {
                      final controller = controllers[7];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.home_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'เลขที่',
                    ),
                    showCursor: false,
                    controller: controllers[8],
                    onChanged: (value) {
                      final controller = controllers[8];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.home_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'หมู่ที่',
                    ),
                    showCursor: false,
                    controller: controllers[9],
                    onChanged: (value) {
                      final controller = controllers[9];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_road_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'ถนน',
                    ),
                    showCursor: false,
                    controller: controllers[10],
                    onChanged: (value) {
                      final controller = controllers[10];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.add_road_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'ซอย',
                    ),
                    showCursor: false,
                    controller: controllers[11],
                    onChanged: (value) {
                      final controller = controllers[11];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'จังหวัด',
                    ),
                    showCursor: false,
                    controller: controllers[12],
                    onChanged: (value) {
                      final controller = controllers[12];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'อำเภอ',
                    ),
                    showCursor: false,
                    controller: controllers[13],
                    onChanged: (value) {
                      final controller = controllers[13];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.location_city_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'ตำบล',
                    ),
                    showCursor: false,
                    controller: controllers[14],
                    onChanged: (value) {
                      final controller = controllers[14];
                    },
                  ),
                ),
                Getfield(
                  child: Text(
                    'ระบุตำแหน่งที่อยู่ปัจจุบัน',
                    style: TextStyle(fontSize: 20, fontFamily: 'Mitr'),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: _radioValuemap,
                        onChanged: _handleRadioValueChangemap,
                      ),
                      Text(
                        'ระบุ',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Radio(
                        value: 1,
                        groupValue: _radioValuemap,
                        onChanged: _handleRadioValueChangemap,
                      ),
                      Text(
                        'ไม่ระบุ',
                        style: TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                      ),
                    ],
                  ),
                ),
                Getfield(
                  child: Row(
                    children: [
                      Icon(
                        Icons.local_hospital_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      DropdownButton(
                          iconSize: 0.0,
                          value: _value,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "สิทธิการรักษา",
                                style:
                                    TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                              ),
                              value: 1,
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "ประกันสุขภาพถ้วนหน้า",
                                style:
                                    TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                              ),
                              value: 2,
                            ),
                            DropdownMenuItem(
                                child: Text(
                                  "ประกันสังคม",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Mitr'),
                                ),
                                value: 3),
                            DropdownMenuItem(
                                child: Text(
                                  "ข้าราชการ",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Mitr'),
                                ),
                                value: 4),
                            DropdownMenuItem(
                                child: Text(
                                  "อื่นๆ",
                                  style: TextStyle(
                                      fontSize: 18, fontFamily: 'Mitr'),
                                ),
                                value: 5),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          }),
                    ],
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.pregnant_woman_rounded,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'ครรภ์ที่',
                    ),
                    showCursor: false,
                    controller: controllers[3],
                    onChanged: (value) {
                      final controller = controllers[3];
                    },
                  ),
                ),
                Getfield(
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      labelStyle: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Mitr'),
                      labelText: 'วันที่มีประจำเดือนครั้งสุดท้าย',
                    ),
                    cursorColor: Colors.black,
                    controller: controllers[5],
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
                          controllers[5].text =
                              DateFormat("dd / MM / yyyy").format(selectedDate);
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Getfield(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Container(
                            width: 50,
                            height: 30,
                            child: Center(
                                child: Text(
                              'ยกเลิก',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                            ))),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.pink),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Container(
                            width: 50,
                            height: 30,
                            child: Center(
                                child: Text(
                              'ยืนยัน',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Mitr'),
                            ))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class Getfield extends StatelessWidget {
  final Widget child;
  const Getfield({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      width: size.width * 0.8,
      child: child,
    );
  }
}
