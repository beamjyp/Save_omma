import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'main.dart';
import 'navigation_bloc.dart';
import 'menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                        ),
                        ListTile(
                          title: Text(
                            "Nitipong",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "Promkam",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        Divider(
                          height: 60,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home_rounded,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Text(
                                    'หน้าหลัก',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Mitr',
                                        color: Colors.white),
                                  ),
                                  onTap: () {
                                    onIconPressed();
                                    BlocProvider.of<NavigationBloc>(context)
                                        .add(NavigationEvents
                                            .HomePageClickedEvent);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_pin_rounded,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Text(
                                    'แก้ไขโปรไฟล์แม่',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Mitr',
                                        color: Colors.white),
                                  ),
                                  onTap: () {
                                    onIconPressed();
                                    BlocProvider.of<NavigationBloc>(context)
                                        .add(NavigationEvents
                                            .SettingMomClickedEvent);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.map,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Text(
                                    'โรงพยาบาลใกล้เคียง',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Mitr',
                                        color: Colors.white),
                                  ),
                                  onTap: () {
                                    onIconPressed();
                                    BlocProvider.of<NavigationBloc>(context)
                                        .add(NavigationEvents
                                            .HospitalClickedEvent);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 240,
                        ),
                        Divider(
                          height: 30,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.exit_to_app,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Text(
                                    'ออกจากระบบ',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Mitr',
                                        color: Colors.white),
                                  ),
                                  onTap: () {
                                    Navigator.of(context)
                                        .popUntil(ModalRoute.withName('/'));
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.black,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
