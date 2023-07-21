import 'package:bloc_loginform_demo/login/bloc/login_bloc.dart';
import 'package:bloc_loginform_demo/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            child: const Padding(
              padding: EdgeInsets.all(30.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome Back User ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.blue),
                  )),
            ),
          ),
          Container(
            height: 400,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Please Log In to start.......",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),),
                  const SizedBox(
                    height: 70,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder()),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                        create: (context) => LoginBloc(),
                                        child: const LoginScreen())));
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));


  }
}
