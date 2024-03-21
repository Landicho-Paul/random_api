import 'package:flutter/material.dart';
import 'package:random_api/main.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'main.dart';
import 'variable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

String? name;
String? gender;
String? country;
String? email;
String? age;
String? phoneNumber;
String? username;
String? status;
String? nationality;
class _HomepageState extends State<Homepage> {
  Future<void> getData() async {

    final response = await http.get(Uri.parse(url));
    setState(() {
      user = [jsonDecode(response.body)];
    });


    name = user[0]['results'][0]['name']['title'] + '. ' + user[0]['results'][0]['name']['first'] + ' ' + user[0]['results'][0]['name']['last'];
    gender = user[0]['results'][0]['gender'];
    country = user[0]['results'][0]['location']['country'];
    email = user[0]['results'][0]['email'];
    username = user[0]['results'][0]['login']['username'];
    age = user[0]['results'][0]['dob']['age'].toString();
    phoneNumber = user[0]['results'][0]['phone'];
    nationality = user[0]['results'][0]['nat'];
    print(age);
    await Future.delayed(const Duration(seconds: 2));

  }
  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(

          backgroundColor: Colors.grey[200],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.list,size: 20,)),
              const Text('Profile',style: TextStyle(fontSize: 20),),
              IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 20,))

            ],
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
            onRefresh: getData,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 20,left: 15,right: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white12,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.0,
                          spreadRadius: 2.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [

                        //image and name
                        Container(
                          margin: const EdgeInsets.only(top: 0,right: 0,left: 0,bottom: 5),
                          padding: const EdgeInsets.all(20),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://t3.ftcdn.net/jpg/04/77/31/58/360_F_477315825_X4wf0pDkRODPTOEXTSQQ5Ut6qlpvzoZB.jpg'),
                                fit: BoxFit.cover, // Adjust the BoxFit as per your requirement
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.blue,
                          ),
                          child: Column(
                            children: [
                               ClipOval(child: Image.network(user[0]['results'][0]['picture']['large']),),
                              //ClipOval(child: Image.network('https://th.bing.com/th/id/OIP.pniCRpG0PJZG3cRr0qjeKwHaHa?rs=1&pid=ImgDetMain',height: 180,),),
                              const SizedBox(height: 20,),
                              Text('$name', style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                            ],
                          ),
                        ),
                        //data of the user

                        Container(
                          margin: const EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 20),
                          padding: const EdgeInsets.all(20),
                          width: double.maxFinite,

                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon((gender == "male")? Icons.male_outlined : Icons.female_outlined, color: (gender == "male")? Colors.blue : Colors.pink,),
                                      const SizedBox(width: 5),
                                      Text('Gender')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$gender'),
                                    ],
                                  )
                                ],
                              ),


                              Divider(thickness: 1,color: Colors.grey,),

                              const SizedBox(height: 10,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_sharp, color: Colors.red[800],),
                                      const SizedBox(width: 5),
                                      Text('Country')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$country'),
                                    ],
                                  )
                                ],
                              ),

                              Divider(thickness: 1,color: Colors.grey,),
                              const SizedBox(height: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.email, color: Colors.black,),
                                      const SizedBox(width: 5),
                                      Text('Email')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$email'),
                                    ],
                                  )
                                ],
                              ),

                              Divider(thickness: 1,color: Colors.grey,),

                              const SizedBox(height: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person_2_outlined, color: Colors.green[800],),
                                      const SizedBox(width: 5),
                                      Text('Username'),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$username'),
                                    ],
                                  )
                                ],
                              ),

                              Divider(thickness: 1,color: Colors.grey,),
                              const SizedBox(height: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_today, color: Colors.blue[800],),
                                      const SizedBox(width: 5),
                                      Text('Age')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$age'),
                                    ],
                                  )
                                ],
                              ),

                              Divider(thickness: 1,color: Colors.grey,),
                              const SizedBox(height: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.phone_android_outlined, color: Colors.purple[800],),
                                      const SizedBox(width: 5),
                                      Text('Phone Number')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$phoneNumber'),
                                    ],
                                  )
                                ],
                              ),

                              Divider(thickness: 1,color: Colors.grey,),
                              const SizedBox(height: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.flag, color: Colors.black,),
                                      const SizedBox(width: 5),
                                      Text('Nationality')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(width: 30,height: 30,),
                                      Text('$nationality'),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )


                      ],
                    ),
                  ),
                )
              ],
            ))
    );
  }
}
