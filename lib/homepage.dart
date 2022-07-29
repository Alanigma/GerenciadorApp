import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.yellow,
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gerenciador',
                style: const TextStyle(color: Colors.purple),
                textScaleFactor: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: 120,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/gerenciador');
                    },
                    child: Icon(
                      Icons.start,
                      color: Colors.purple,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
