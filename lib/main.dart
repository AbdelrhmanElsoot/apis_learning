import 'package:apis_learning/networking/networking_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  NetworkingHelper getData = NetworkingHelper();
                  getData.getAllData();
                },
                child: Text('Get All'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  NetworkingHelper getData = NetworkingHelper();
                  getData.postData();
                },
                child: Text('Post data'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  NetworkingHelper getData = NetworkingHelper();
                  getData.deleteData(id: 5);
                },
                child: Text('Delete data with id'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
