import 'package:flutter/material.dart';
import 'package:telin_project/services/api_service.dart';
import 'package:telin_project/services/shared_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telkom Infra"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                SharedService.logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
        future: APIService.getUserProfile(),
        builder: (BuildContext context, AsyncSnapshot<String> model) {
          if (model.hasData) {
            return Center(
              child: Text(model.data!),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
