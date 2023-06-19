import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dificuldadeController = TextEditingController();
  final TextEditingController imagemController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    dificuldadeController.dispose();
    imagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ola"),
      ),
      body: ListView(children: [
        SizedBox(
          height: 50,
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              height: 650,
              width: 375,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Erro";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: dificuldadeController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "dificuldade",
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Erro";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {});
                        },
                        controller: imagemController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "imagem",
                          fillColor: Colors.black12,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Erro";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 3, color: Colors.black12),
                          color: Colors.blue),
                      width: 150,
                      height: 300,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imagemController.text,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              child: Icon(Icons.cameraswitch_sharp),
                            );
                          },
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(dificuldadeController.text);

                            print(imagemController.text);
                          } else {}
                        },
                        child: Text("Enviar")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
