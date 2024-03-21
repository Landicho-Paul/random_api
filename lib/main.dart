import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_builder/responsive_builder.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    children: [

                      Text(
                        'RamdomME',
                        style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 4.0),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 300,
              ),
            )
          ],
        ),
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double maxWidth = MediaQuery.of(context).size.width;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.deepPurpleAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 15),
                              Text(
                                'City: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                               " " ,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 20),

                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 15),
                            Text(
                              "",
                              style:
                              TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 70,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.deepPurpleAccent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Temperature :',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Humidity  :',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Country  :',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
