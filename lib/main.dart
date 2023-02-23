import 'package:flutter/material.dart';
import 'custom_pop_over.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  @override
  Widget build(BuildContext context) {
    bool show= false;
    List<int> curr=[2,4,3];
    List<int> curr2=[5,6,4];
    String num="";
    String num2="";
    int result;
    List resultList=[];


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              CustomPopOver(),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          // for(int i=0;i<curr.length;i++){
          //   num = curr[i].toString() + num;
          //   print(num);
          // }
          //
          // for(int i=0;i<curr2.length;i++){
          //   num2 = curr2[i].toString() + num2;
          //   print(num2);
          // }
          //
          //
          // result = int.parse(num)+int.parse(num2);
          // for(int i=0;i<result.toString().length;i++){
          //   resultList.add(result.toString()[i]);
          //   print(resultList);
          // }

          var input =  121; // Amélie
          // print(new String.fromCharCodes(input.toString().runes.toList().reversed));
          // print(input.toString().split('').reversed.join());
          if(input.toString().split('').reversed.join() !=
              input.toString()){
           print(false);
          }
          print(true);



        },
        label: const Text("Submit"),
      ),
    );
  }
}