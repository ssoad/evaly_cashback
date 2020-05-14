import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evaly Cashback Calculator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(
        title: 'Evaly Cashback Calculator',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double price = 0;
  double cashback = 0;
  double amount1 = 0;
  double amount2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              widget.title,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: <Widget>[
                  Container(
                    //color: Colors.blueGrey,
                    constraints: BoxConstraints(
                      minHeight: 40,
                      maxHeight: 70,
                      minWidth: double.infinity,
                    ),
                    child: Image.asset('images/logo.png'),
                  ), //logo
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.all(50),
                      constraints: BoxConstraints(
//                      // minHeight: 150,
//                      minWidth: double.infinity,
                          ),
                      //color: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (value) {
                              price = double.parse(value);
                              //print(price);
                            },
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                filled: true,
                                hintText: 'Enter Product Price',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                )),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            onChanged: (value) {
                              cashback = double.parse(value);
                              //print(cashback);
                            },
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                                filled: true,
                                hintText: 'Enter % of Cashback',
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                ),
                                hintStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blueGrey,
                                )),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            color: Colors.redAccent,
                            onPressed: () {
                              setState(() {
                                amount1 = (price) / (1 + cashback / 100);
                              });
                            },
                            child: Text(
                              'Calculate',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ],
                      )),
                  amount1 > 0
                      ? Container(
                          padding: EdgeInsets.all(20),
                          constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Method 1: Full Payment',
                                style: resStyle,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text('Payable Amount:' + price.toInt().toString(),
                                  style: resStyle),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  'Cashback: ' +
                                      (price * (cashback / 100))
                                          .toInt()
                                          .toString(),
                                  style: resStyle),
                            ],
                          ),
                        )
                      : Text(''),
                  SizedBox(
                    height: 5,
                  ),
                  amount1 > 0
                      ? Container(
                          padding: EdgeInsets.all(20),
                          constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: double.infinity,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Method 2: Partial Payment',
                                style: resStyle,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  'Payable Amount:' +
                                      (amount1).toInt().toString(),
                                  style: resStyle),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                  'Cashback: ' +
                                      (amount1 * (cashback / 100))
                                          .toInt()
                                          .toString(),
                                  style: resStyle),
                            ],
                          ),
                        )
                      : Text(''), //input
                ],
              )),
        ));
  }
}
