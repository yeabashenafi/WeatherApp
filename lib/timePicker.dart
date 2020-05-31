import 'package:flutter/material.dart';

class timepicker extends StatefulWidget {

  final List<String> tabItems;//establishes properties that are passed into it.
  //this list contains strings that are displayed as times of the day.
//  final ForecastController forecastController;//class that makes it easier to fetch forecast data.

  final Function onTabChange ;//callback the parent passes in.In this case,it's used
  //to notify the parent when a new tab is selected.
  final int startIndex ; // tells tab-bar which tab is selected by default

   const timepicker({
    Key key,
//    this.forecastController,
    this.tabItems,
    this.onTabChange,
    this.startIndex
}) : super(key: key);

  @override
  _timepickerState createState() => _timepickerState();
}

class _timepickerState extends State<timepicker>
  with SingleTickerProviderStateMixin {

  TabController _tabController;
  int activeTabIndex;

  @override
  void initState(){
    //creates the Controller and it must know how many tabs will exist
    _tabController  = TabController(
      length: 3,
      vsync: this,
      initialIndex: 1
//      initialIndex: widget.startIndex,
    );
    _tabController.addListener(handleTabChange);
    super.initState();
  }

  void handleTabChange(){
    if (_tabController.indexIsChanging) return;
    widget.onTabChange(_tabController.index);
    setState((){
        activeTabIndex = _tabController.index;
    });
  }

  Widget build(BuildContext context) {
//    return Text("yes Queen");
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 10.0),
      labelStyle: Theme.of(context).textTheme.caption.copyWith(fontSize: 12.0),
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.symmetric(horizontal: 48.0,vertical: 8.0),
      controller: _tabController,
      tabs: <Widget>[
        Text('00:00',
        style:TextStyle(
          fontSize: 15.0,
          color: Colors.amber,
        )),
        Text('12:00',
          style:TextStyle(
          fontSize: 15.0,
            color: Colors.amber,
          )
    ),
        Text('24:00',
        style:TextStyle(
          fontSize: 15.0,
          color: Colors.amber,
      )
    )
      ],
    );
  }
}
