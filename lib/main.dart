import 'package:flutter/material.dart';
import 'package:flames/findFlames.dart';
void main() => runApp(Home());


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final boyname = TextEditingController();
  final girlname = TextEditingController();

  String flames = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flames',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Explora',
          ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.pinkAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: boyname,
                decoration: InputDecoration(
                  hintText: 'Enter boy name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: (){
                        boyname.clear();
                      },
                      icon: const Icon(Icons.clear_sharp)),
                  suffixIconColor: Colors.black45
                )
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: girlname,
                decoration: InputDecoration(
                    hintText: 'Enter girl name',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: (){
                          girlname.clear();
                        },
                        icon: const Icon(Icons.clear_sharp)),
                    suffixIconColor: Colors.black45
                ),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                color: Colors.pink[400],
                onPressed: (){
                  setState(() {
                    FindFlames(boyname: boyname, girlname: girlname);
                    flames = 'Vaipilla Raja';
                  });
                },
                textColor: Colors.white,
                elevation: 5.0,
                child: const Text('Submit'),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(flames,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
