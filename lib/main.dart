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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var wtController = TextEditingController();
  var result = '';
  var bgColor = Colors.purple.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade100,
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w700,
                fontSize: 35),),
                SizedBox(height: 11,),
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text('Enter your weight (kg)',),
                    prefixIcon: Icon(Icons.line_weight_outlined)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (ft)',),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inchController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Enter your Height (inch)',),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(height: 11,),
                SizedBox(height: 40,
                  width: 110,
                  child: ElevatedButton(
                      onPressed: (){
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();
                    if(wt != "" && ft != "" && inch != ""){
                      //BMI Calculcation
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);
                      var tInch = (ift*12) + iInch;
                      var tcm = tInch*2.54;
                      var tm = tcm/100;
                      var bmi = iwt/(tm*tm);
                      var msg = '';
                      if(bmi<18){
                        bgColor = Colors.red;
                        msg = 'You are Under Weight!!';
                      }
                      else if(bmi>25){
                        bgColor = Colors.yellow;
                        msg = 'You are over weight!!';
                      }
                      else {
                        bgColor = Colors.green;
                        msg = 'You are Healthy!!';
                      }
                      setState(() {
                        result = ' $msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                      });

                    }
                    else{
                      result = 'Please fill all required fields';
                    }
                    setState(() {

                    });
                  }, child: Text('Calculate',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent[700],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 11,),
                Text(result , style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}