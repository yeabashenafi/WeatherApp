import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cityPicker.dart';
import 'utils/utils.dart' as ui;
import 'timePicker.dart' as timetab;

cityPicker city = cityPicker();

void main(){
//  AppSettings settings = AppSettings();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]

  )
  .then((_) => runApp(
    MyApp(),
//    MyApp(settings:settings),
  ));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
//      theme: theme,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: "AlgreyaSansSC",
//        primaryTextTheme: Theme.of(context).textTheme.apply(
//          bodyColor: Colors.black45,
//          displayColor: Colors.black45,
//        ),
//        textTheme: Theme.of(context).textTheme.apply(
//          bodyColor: Colors.black45,
//          displayColor: Colors.black45,
//        )
//        fontSize: 25.0,
      ),
      home: MyHomePage(
        title: 'Weather App',

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  var City = cityPicker().getCityName();


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;

  String image ;
  List <String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ]  ;
  List <IconData> icons = [
    Icons.wb_sunny,
    Icons.cloud,
    Icons.wb_sunny,
    Icons.cloud,
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.cloud

  ];

  String getImage(){
    setState((){
      image = city.getImage();
    });
    return 'images/$image';
  }
  void next_city(){
    setState(() {
      city.nextCity();
    });
  }
  var sunny = 'images/Windows Photo Viewer Wallpaper.jpg';
  void previous_city(){
    setState(() {
      city.preciousCity();
    });
  }



  @override
  Widget build(BuildContext context){

    return Scaffold(
//      Color:Colors.amber,
//      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ui.appBarHeight(context)),

        child: AppBar(

          title: Text(widget.title),

          leading: FlatButton(
            child: Icon(
              Icons.menu
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.search
            )
          ],
        ),

      ),
      drawer:Drawer(
        elevation: 20.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Text('Add a City'),
                  Icon(Icons.add),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: city.no_of_cities(),

              itemBuilder: (BuildContext context,int index ){
                var city_name = city.allCityNames()[index];
                return Dismissible(
                  key:Key(city_name),
                  child: CheckboxListTile(
                    value: true,
                    title: Text(city_name),
                    onChanged: null),
                );
              }),
          ],
        ),
      ),
      body:Stack(
        children:[
      Container(
            foregroundDecoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(
                getImage(),

              ),
        fit: BoxFit.fill
              )
            ),
        ),
          Padding(

            padding: const EdgeInsets.all(8.0),
            child: Column(

              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Icon(
                        Icons.arrow_left,
                        size:40,
                        color: Colors.amber
                      ),
                      onPressed: (){
                        previous_city();
                      },
                    ),
                    Text(
                      city.getCityName(),
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.amber
                      ),),
                    FlatButton(
                      child: Icon(
                        Icons.arrow_right,
                        size:40,
                        color: Colors.amber
                      ),
                      onPressed: (){
                        next_city();
                      },
                    )
                  ],
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(100.0),
//                    1: FixedColumnWidth(100.0),
                    2: FixedColumnWidth(40.0),
                    3: FixedColumnWidth(40.0),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: List.generate(7,(int index){
                    var currentDay = days[index];
                    var icon = icons[index];
                    var high = city.getHighTemps()[index];
                    var low  = city.getLowTemps()[index];

//                    print(runtimeType);
                    return TableRow(
                      children: [
                        TableCell(
                          child:  Padding(
                            padding:const EdgeInsets.all(4.0),
                            child:Text(
                              '$currentDay',
                              style:TextStyle(
                                fontSize: 18.0,
                                color: Colors.amber
                              )
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:Icon(
                              icon,
                              color: Colors.amber
//                              size: 16.0,
                            )
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('$high',
                              style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.amber
                              )
                            ),

                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('$low',
                              style:TextStyle(
                                fontSize: 20.0,
                                color: Colors.amber,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ),
                        ),

                      ]
                    );
                  }),
                ),
                Container(
                  child: timetab.timepicker(),
                ),
              ],
            ),
          )
        ],

      ),
    );

//      floatingActionButton: FloatingActionButton(
//        onPressed: _refreshCounter,
//        tooltip: 'Increment',
////        color:Colors.black26,
//        child: Icon(Icons.refresh),
////      ), // This trailing comma makes auto-formatting nicer for build methods.
////    );
  }
}
