import 'package:flutter/material.dart';

class WeightOnPlanet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new WeightOnPlanetState();
  }
}

class WeightOnPlanetState extends State<WeightOnPlanet> {

  /*Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06*/


  final weightcontroller=new TextEditingController();
  double w;
  String st="Welcome";
  var _X = [
    'images/earth_gif.gif',
    'images/mars_gif.gif',
    'images/venus_gif.gif',
    'images/pluto_gif.gif'
  ];
  FocusNode focus=new FocusNode();
  int radiovalue = 0;

  @override
  void initState() {
    super.initState();
    focus.addListener(onfocus);
  }

  void onfocus(){
    check(0);
  }

  void clear(){
    setState(() {
      weightcontroller.text="";
      st="Enter Weight";
      check(0);
    });
  }
  void check(int value) {
    setState(() {
      radiovalue = value;
      try{
      if(weightcontroller.text.isNotEmpty){
        switch(radiovalue){
          case 0:
            w = double.parse(weightcontroller.text);
            st = "Your Weight On Earth Is $w Kg";
            break;
          case 1:
            w=double.parse(weightcontroller.text)*0.38;
            st = "Your Weight On Mars Is $w Kg";
            break;
          case 2:
            w=double.parse(weightcontroller.text)*0.91;
            st = "Your Weight On Venus Is $w Kg";
            break;
          case 3:
            w=double.parse(weightcontroller.text)*0.06;
            st = "Your Weight On Pluto Is $w Kg";
            break;
        }
      }
      else{
        st="Enter Weight";
      }
      }
      catch(Exception){
       st="Wrong Input";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Weight On Planet X"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: GestureDetector(
       child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Image.asset(
                    _X[radiovalue],
                    height: 190,
                    width: 190,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Theme(
                      data: ThemeData(
                        primaryColor: Colors.white,
                        primaryColorDark: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Enter Your Weight On Earth In Kg",
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(Icons.content_cut),
                              onTap: clear,
                            ),
                            hintStyle:
                            TextStyle(color: Colors.white, fontSize: 15.0)),
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.number,
                        focusNode: focus,
                        autofocus: false,
                        controller: weightcontroller,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //radio buttons
                    Radio<int>(
                      value: 1, groupValue: radiovalue, onChanged: check,
                      activeColor: Colors.red,

                    ),
                    Text(
                      "Mars",
                      style: TextStyle(color: Colors.white,
                      fontSize: 18.5),
                    ),
                    Radio<int>(
                      value: 2, groupValue: radiovalue, onChanged: check,
                      activeColor: Colors.yellow.shade100,),
                    Text(
                      "Venus",
                      style: TextStyle(color: Colors.white,
                          fontSize: 18.5),
                    ),
                    Radio<int>(
                      value: 3, groupValue: radiovalue, onChanged: check,
                      activeColor: Colors.brown,),
                    Text(
                      "Pluto",
                      style: TextStyle(color: Colors.white,
                          fontSize: 18.5),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 58.5),
                child: Column(
                  children: <Widget>[
                    Text(st,
                    style: TextStyle(color: Colors.white,
                    fontSize: 32.5
                    ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        onTap:()=>FocusScope.of(context).requestFocus(new FocusNode()),

      )
    );
  }
}
