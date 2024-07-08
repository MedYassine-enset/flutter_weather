import 'package:flutter/material.dart';
import './weather.dart';
class WeatherForm extends StatefulWidget {
  @override
  _WeatherFormState createState() => _WeatherFormState();
}
class _WeatherFormState extends State<WeatherForm> {
  late String city;
  TextEditingController cityEditingController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${city}'),backgroundColor:
        Colors.deepOrangeAccent,),
        body: Column(
            children: <Widget>[
        Container(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
        child: TextField(
        decoration: InputDecoration(hintText: 'Tape a City..'),
    controller: cityEditingController,
    onChanged: (String str){
    setState((){
    city=str;
    });
    },onSubmitted: (String str){

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Weather(city)));
          cityEditingController.text="";
        },
        ),
        ),
        ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: RaisedButton(
                  child: Text('Get Weather'),
                  textColor:Colors.white ,
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Weather(city)));
                    cityEditingController.text="";
                  },
                  color: Colors.deepOrangeAccent,
                ),
              )
            ],
        ),
    );
  }
  @override
  void initState() {
    super.initState();
    String
    url='http://openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=b6907d289e10d714a6e88b30761fae22';
    print(url);
    this.getData(url);
  }
  @override
  Widget build(BuildContext context) {
    List<String> listData=getListData();
    return Scaffold(
        appBar: AppBar(title: Text('${widget.city}'),backgroundColor:

        Colors.orange,),
        body:

        (weatherData==null)?Center(child: CircularProgressIndicator()):

        ListView.builder(
            itemCount: weatherData==null?0:weatherData.length,
            itemBuilder: (context,index){
              return Card(
// List ITEM ...
              );
            })
    );
  }
}