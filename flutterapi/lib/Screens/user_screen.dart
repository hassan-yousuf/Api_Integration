import 'package:apiintegration/Services/user_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white70,
        title: Text(' Api  Integration '),
      ),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: const CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${snapshot.data[index].id}"),
                      title: Text("${snapshot.data[index].name}"),
                      subtitle: Text("${snapshot.data[index].email}"),
                    );
                  });
            }
          }),
    );
  }
}
