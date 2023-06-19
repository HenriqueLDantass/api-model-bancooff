import 'package:estudosalura/api/api.dart';
import 'package:estudosalura/database/local_database.dart';
import 'package:estudosalura/screens/teste.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Buscar usuarios'),
              onPressed: () {
                Api().fetchUser();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Test()));
              },
            ),
           
          ],
        ),
      ),
    );
    ;
  }
}
