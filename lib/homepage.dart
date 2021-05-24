import 'package:flutter/material.dart';
import 'navigation_bloc.dart';

class HomePage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.pinkAccent,
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.notifications_active,
                    size: 30,
                    color: Colors.red[900],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.chat_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 321,
                            height: 200,
                            child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'ผลการคัดกรองแม่',
                                    style: TextStyle(
                                        fontFamily: 'Mitr',
                                        color: Colors.white,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 321,
                            child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 3),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: ExpansionTile(
                                      initiallyExpanded: false,
                                      backgroundColor: Colors.black,
                                      title: Text(
                                        'ประวัติคัดกรอง/ทำไมถึงเสี่ยง',
                                        style: TextStyle(
                                            fontFamily: 'Mitr',
                                            color: Colors.white),
                                      ),
                                      children: [
                                        Text(
                                          'ท่านฝากครรภ์หรือยัง',
                                          style: TextStyle(
                                              fontFamily: 'Mitr',
                                              color: Colors.white),
                                        ),
                                        Row(children: [
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 16),
                                            child: Text(
                                              'test',
                                              style: TextStyle(
                                                  fontFamily: 'Mitr',
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
