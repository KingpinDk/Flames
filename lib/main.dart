import 'package:flutter/material.dart';
import 'package:flames/findFlames.dart';
void main() => runApp(const MaterialApp(home: Home()));


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final boyName = TextEditingController();
  final girlName = TextEditingController();

  String relate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: boyName,
                decoration: InputDecoration(
                  hintText: 'Enter boy name',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: (){
                        boyName.clear();
                      },
                      icon: const Icon(Icons.clear_sharp)),
                  suffixIconColor: Colors.black45
                )
              ),
              const SizedBox(height: 20.0,),
              TextField(
                controller: girlName,
                decoration: InputDecoration(
                    hintText: 'Enter girl name',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: (){
                          girlName.clear();
                        },
                        icon: const Icon(Icons.clear_sharp)),
                    suffixIconColor: Colors.black45
                ),
              ),
              const SizedBox(height: 20.0),
              MaterialButton(
                color: Colors.pink[400],
                onPressed: (){
                    if(boyName.text.isEmpty || girlName.text.isEmpty)
                      {
                        print('ok');
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('enter all fields'),
                            ));
                      }
                    else
                      {
                        Flames flames = Flames(boyname: boyName, girlname: girlName);
                        relate = flames.findFlames();
                        boyName.clear();
                        girlName.clear();
                        if(relate == 'F')
                          {
                            setState(() {
                              relate = 'Friend';
                            });
                          }
                        else if(relate == 'L')
                          {
                            setState(() {
                              relate = 'LOVER';
                            });
                          }
                        else if(relate == 'A')
                          {
                            setState(() {
                              relate = 'AFFECTION';
                            });
                          }
                        else if(relate == 'M')
                          {
                            setState(() {
                              relate = 'MARRY';
                            });
                          }
                        else if(relate == 'E')
                          {
                            setState(() {
                              relate = 'ENEMY';
                            });
                          }
                        else if(relate == 'S')
                          {
                            setState(() {
                              relate = 'SISTER';
                            });
                          }
                        else
                        {
                        setState(() {
                        });
                        }

                      }
                },
                textColor: Colors.white,
                elevation: 5.0,
                child: const Text('Submit'),
              ),
              SizedBox(height: 20.0),
              Center(
                child: Text(relate,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

            ],
          ),
        ),
    );
  }
}
