import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dropdowns",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String value = "";
  String stateValue = "";
  String cityValue = "";
  List<DropdownMenuItem<String>> menuitems = [];
  bool disabledropdown = true;
  final tamilNadu = {
    "1": "Chennai",
    "2": "Kallakurichi",
    "3": "Thiruchy",
  };

  final Kerala = {
    "1": "Palakkad",
    "2": "Thrissur",
    "3": "Cochin",
  };

  final Delhi = {
    "1": "Chandni chowk",
    "2": "Daryaganj",
    "3": "Jhandewalan",
  };

  void populatetamilNadu() {
    for (String key in tamilNadu.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(tamilNadu[key]!),
        ),
        value: tamilNadu[key],
      ));
    }
  }

  void populateKerala() {
    for (String key in Kerala.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(Kerala[key]!),
        ),
        value: Kerala[key],
      ));
    }
  }

  void populateDelhi() {
    for (String key in Delhi.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(Delhi[key]!),
        ),
        value: Delhi[key],
      ));
    }
  }

  void selected(_value) {
    if (_value == "tamilNadu") {
      menuitems = [];
      populatetamilNadu();
    } else if (_value == "Kerala") {
      menuitems = [];
      populateKerala();
    } else if (_value == "Delhi") {
      menuitems = [];
      populateDelhi();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
    });
  }

  void secondselected(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dropdown",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton<String>(
                //value: va,
                isExpanded: true,
                items: [
                  DropdownMenuItem<String>(
                    value: "Kerala",
                    child: Text("Kerala"),
                  ),
                  DropdownMenuItem<String>(
                    value: "tamilNadu",
                    child: Text("tamilNadu"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Delhi",
                    child: Text("Delhi"),
                  ),
                ],
                onChanged: ( _value) {
                  //stateValue = _value!;
                  selected(_value);
                },
                hint: Text(
                  //(value.isEmpty) ? 
                  "Select a state" 
                  //: stateValue
                  ),
              ),
              DropdownButton<String>(
                isExpanded: true,
                items: menuitems,
                onChanged:
                    disabledropdown ? null : (_value) => secondselected(_value),
                hint: Text((cityValue.isEmpty) ? "Select a City" : cityValue),
                disabledHint: Text("First Select a state"),
              ),
              Text(
                "$value",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() => runKerala(MyKerala());

// class MyKerala extends StatelessWidget {
//   // This widget is the root of your Keralalication.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialKerala(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     _getStateList();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       KeralaBar: KeralaBar(
//         title: Text('Dynamic DropDownList REST API'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Container(
//             alignment: Alignment.topCenter,
//             margin: EdgeInsets.only(bottom: 100, top: 100),
//             child: Text(
//               'KDTechs',
//               style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
//             ),
//           ),
//           //======================================================== State

//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton<String>(
//                         value: _myState,
//                         iconSize: 30,
//                         icon: (null),
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 16,
//                         ),
//                         hint: Text('Select State'),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _myState = newValue!;
//                             _getCitiesList();
//                             print(_myState);
//                           });
//                         },
//                         items: statesList?.map((item) {
//                               return new DropdownMenuItem(
//                                 child: new Text(item['name']),
//                                 value: item['id'].toString(),
//                               );
//                             })?.toList() ??
//                             [],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),

//           //======================================================== City

//           Container(
//             padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//                       alignedDropdown: true,
//                       child: DropdownButton<String>(
//                         value: _myCity,
//                         iconSize: 30,
//                         icon: (null),
//                         style: TextStyle(
//                           color: Colors.black54,
//                           fontSize: 16,
//                         ),
//                         hint: Text('Select City'),
//                         onChanged: (String? newValue) {
//                           setState(() {
//                             _myCity = newValue!;
//                             print(_myCity);
//                           });
//                         },
//                         items: citiesList?.map((item) {
//                               return new DropdownMenuItem(
//                                 child: new Text(item['name']),
//                                 value: item['id'].toString(),
//                               );
//                             })?.toList() ??
//                             [],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   //=============================================================================== Api Calling here

// //CALLING STATE API HERE
// // Get State information by API
//   List statesList = [];
//   String _myState = "";

//   String stateInfoUrl = 'http://cleanions.besttamilNadu.my/api/location/get_state';
//   Future<String?> _getStateList() async {
//     await http.post(Uri.parse(stateInfoUrl), headers: {
//       'Content-Type': 'Keralalication/x-www-form-urlencoded'
//     }, body: {
//       "api_key": '25d55ad283aa400af464c76d713c07ad',
//     }).then((response) {
//       var data = json.decode(response.body);

// //      print(data);
//       setState(() {
//         statesList = data['state'];
//       });
//     });
//   }

//   // Get State information by API
//   List citiesList = [];
//   String _myCity = "";

//   String cityInfoUrl =
//       'http://cleanions.besttamilNadu.my/api/location/get_city_by_state_id';
//   Future<String?> _getCitiesList() async {
//     await http.post(Uri.parse(cityInfoUrl), headers: {
//       'Content-Type': 'Keralalication/x-www-form-urlencoded'
//     }, body: {
//       "api_key": '25d55ad283aa400af464c76d713c07ad',
//       "state_id": _myState,
//     }).then((response) {
//       var data = json.decode(response.body);

//       setState(() {
//         citiesList = data['cities'];
//       });
//     });
//   }
// }
