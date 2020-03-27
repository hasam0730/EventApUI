import 'package:event_ap_ui/style.dart';
import 'package:event_ap_ui/widgets/expanded_section.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isExpanded = false;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            overflow: Overflow.visible,
            children: <Widget>[
              buildMainHeader(),
              buildToogleButton(),
            ],
          ),
          buildExpandableChildren(),
        ],
      ),
    );
  }

  Positioned buildToogleButton() {
    return Positioned(
      bottom: -30,
      child: InkResponse(
        onTap: () {
          _toogleExpand();
        },
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.indigo[900],
              border: Border.all(
                width: 10,
                color: Colors.white,
              ),
            ),
            child: Icon(
              _isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              size: 42,
              color: Colors.white,
            )),
      ),
    );
  }

  Container buildMainHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 66, 24, 24),
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/header_image.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Amazing \nevents happening\n near you',
              style: mainTitleStyle,
            ),
            SizedBox(height: 12),
            Text(
              '32 Events in your area',
              style: mainSubtitleStyle,
            ),
            SizedBox(height: 12),
            buildSearchBar()
          ],
        ),
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: searchBarDecoration,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
              size: 18,
            ),
            border: InputBorder.none,
            hintText: 'Search for an event ...',
            hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildExpandableChildren() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ExpandedSection(
        isExpanded: _isExpanded,
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              _buildHorizontalDatesCalender(),
              SizedBox(height: 10),
              _buildDistanceSelectorSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalDatesCalender() {
    return TableCalendar(
      calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: {CalendarFormat.week: ''},
      calendarStyle: CalendarStyle(selectedColor: searchBarColor),
    );
  }

  Widget _buildDistanceSelectorSlider() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                spreadRadius: 5,
                color: searchBarColor)
          ]),
    );
  }
}
