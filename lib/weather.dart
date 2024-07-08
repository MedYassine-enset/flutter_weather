import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  int counter;
  Weather(this.counter);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'), backgroundColor: Colors.orange,),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Counter=$counter', style: TextStyle(fontSize: 22),),
            RaisedButton(child: Text('Add'), color: Colors.blue, onPressed: () {
              ++counter;
            },)
          ],),

      ),
    );

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

                  color: Colors.deepOrangeAccent,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                      Row(
                      children: <Widget>[
                      CircleAvatar(

                      backgroundImage: AssetImage('images/${weatherData[index]['weather'][0]['main'].toLowerCase()}.png'),

                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                    Text("${new DateFormat('E dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt']*1000000))}",
                    style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.bold)),
                Text("${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatherData[index]['dt']*1000000))} |
                  ${weatherData[index]['weather'][0]['main']}",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold)),

                  ],
                ),
              ),
              ],
              ),
              Text("${weatherData[index]['main']['temp'].round()} °C", style: TextStyle(fontSize: 20,color:

              Colors.white,fontWeight:FontWeight.bold),),

              ],
              ),
              ),
              );
            })
    );
  }
}
