import 'package:flutter/material.dart';

void main() {
  runApp(IAmRichApp());
}

class IAmRichApp extends StatefulWidget {
  const IAmRichApp({super.key});

  @override
  State<IAmRichApp> createState() => _IAmRichAppState();
}

class _IAmRichAppState extends State<IAmRichApp> {
  int money = 0;

  String getStatus(){
    if(money >= 1000){
      return 'I AM RICH';
    }else if(money >= 500){
      return 'Можно пить кофе';
    }else if(money >= 200){
      return 'Уже лучше';
    }else{
      return 'Пока не богат';
    }
  }

  Color getBackgroundColor(){
    if(money >= 1000){
      return Colors.amber.shade700;
    }else if(money >= 500){
      return Colors.blue.shade800 ;
    }else if(money >= 200){
      return Colors.green.shade700;
    }else{
      return Colors.blueGrey.shade900;
    }
  }

  String getEmoji(){
    if(money >= 1000){
      return '💎';
    }else if(money >= 500){
      return '😎';
    }else if(money >= 200){
      return '😊';
    }else{
      return '😢';
    }
  }

  ElevatedButton myButton(){
    return   ElevatedButton(
      onPressed: () {
        setState(() {
          money += 100;
        });
      },
      child: Text('Стать богаче'),
    );
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        backgroundColor: getBackgroundColor(),
        appBar: AppBar(
          title: Text('I Am Rich'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[300],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getEmoji(),
                style: TextStyle(
                  fontSize: 180,
                ),
              ),
              Text(
                getStatus(),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        money += 100;
                      });
                    },
                    child: Text('Стать богаче'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        money = 0;
                      });
                    },
                    child: Text('Потратить всё состояние'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Моё состояние:',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '\$$money',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
