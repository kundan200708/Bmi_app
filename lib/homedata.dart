import "package:flutter/material.dart";

class Homedata extends StatefulWidget {
  const Homedata({super.key});

  @override
  State<Homedata> createState() => _HomedataState();
}

class _HomedataState extends State<Homedata> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.red.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi_Application'),
        titleSpacing: 25,
        titleTextStyle: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 25,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: bgcolor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),

              child: Container(
                height: 400,
                // color: Colors.amberAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Calculate your Bmi',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: wtcontroller,
                      decoration: InputDecoration(
                        label: Text('Enter your weight(in kgs)'),
                        prefixIcon: Icon(Icons.line_weight_outlined),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: ftcontroller,
                      decoration: InputDecoration(
                        label: Text('Enter your height (in feet)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 11),
                    TextField(
                      controller: inchcontroller,
                      decoration: InputDecoration(
                        label: Text('Enter your height (in inches)'),
                        prefixIcon: Icon(Icons.height),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var inch = inchcontroller.text.toString();
                        var feet = ftcontroller.text.toString();

                        if (wt.isNotEmpty &&
                            feet.isNotEmpty &&
                            inch.isNotEmpty) {
                          //   Bmi Calculation
                          var iwt = int.parse(wt);
                          var ift = int.parse(feet);
                          var iinch = int.parse(inch);

                          var tinch = (ift * 12) + iinch;
                          var tcm = tinch * 2.54;

                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm);

                          setState(() {
                            var msg;
                            if (bmi > 25) {
                              msg = "You're OverWeight!!";
                              bgcolor = Colors.orangeAccent.shade200;
                            } else if (bmi < 18) {
                              msg = "You're UnderWeight!!";
                              bgcolor = Colors.redAccent.shade700;
                            } else {
                              msg = "You're Healthy!!";
                              bgcolor = Colors.green.shade200;
                            }
                            result =
                                "$msg \n Your total bmi is:- ${bmi.toStringAsFixed(3)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the required blanks";
                          });
                        }
                      },
                      child: Text('Calculate'),
                    ),

                    SizedBox(height: 15),
                    Text(
                      result,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
