// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your BMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Your BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade100;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('BMI', style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.w700
                  ),
                  ),

                  SizedBox(height: 21,),

                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      label: Text('Enter your Weight (in Kgs)'),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: feetController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height (in feet)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 11,),

                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text('Enter your Height (in inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  SizedBox(height: 16),

                  ElevatedButton(onPressed: (){

                    var weight = weightController.text.toString();
                    var feet = feetController.text.toString();
                    var inch = inchController.text.toString();

                    if (weight != '' && feet != '' && inch != ''){

                      var iWeight = int.parse(weight);
                      var iFeet = int.parse(feet);
                      var iInch = int.parse(inch);

                      var totalInch = (iFeet * 12) + iInch;

                      var totalCm = totalInch * 2.54;

                      var totalMeter = totalCm / 100;

                      var BMI = iWeight / (totalMeter * totalMeter);

                      var msg = "";

                      if (BMI > 25){
                        msg = 'You are OverWeight!';
                        bgColor = Colors.orange.shade200;
                      } else if (BMI < 18){ 
                        msg = 'You are UnderWeight!';
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = 'You are Healthy!';
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                      result = '$msg \n Your BMI is: ${BMI.toStringAsFixed(2)}';
                      });

                    } 
                    else {
                      setState(() {
                        result = 'Please fill all the required blanks';
                      });
                    }


                  }, child: Text('Calculate'),),

                  SizedBox(height: 11),

                  Text(result, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500,),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}




