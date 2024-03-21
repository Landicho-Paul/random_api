import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'variable.dart';
import 'homepage.dart';
void main()=> runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Loading(),
));

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> getData() async {

    try {
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 7));

      user = [jsonDecode(response.body)];
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const Homepage()));

    }catch(e) {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Message'),
          content: const Text('No Internet Connection'),
          actions: [
            TextButton(onPressed: (){
              getData();
              Navigator.pop(context);
            }, child: const Text('Retry'))
          ],
        );
      });
    }


  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(40),
            color: Colors.white12,
            boxShadow: const [
              BoxShadow(
                color: Colors.white12,
                blurRadius: 3.0,
                spreadRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('RANDOM USER API', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Image.network('https://media.giphy.com/media/cMQopWp5e3YyP1lMrc/giphy.gif', height: 200,),
                const SizedBox(height: 30,),
                //const LinearProgressIndicator(color: Colors.black,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}