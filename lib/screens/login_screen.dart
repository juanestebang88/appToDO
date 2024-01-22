import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0 ,length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                unselectedLabelColor: Colors.red,
                labelColor: Colors.red,
                tabs: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Sing In'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Sign Up'),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                      child: Center(
                        child: Icon(Icons.app_blocking),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Icon(Icons.app_registration),
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}