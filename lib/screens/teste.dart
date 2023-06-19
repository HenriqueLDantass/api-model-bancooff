import 'package:estudosalura/api/api.dart';
import 'package:estudosalura/api/model/api_model.dart';
import 'package:estudosalura/database/local_database.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("usuarios api"),
      ),
      body: FutureBuilder<List<User>>(
        future: DataBaseHelper.instance.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Column(
                  children: [
                    Card(
                      child: Column(
                        children: [
                          Text(user.id.toString()),
                          ListTile(
                            title: Text(user.title),
                            subtitle: Text(user.body),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text('Nenhum usuário encontrado'));
          }
        },
      ),
    );
  }
}
