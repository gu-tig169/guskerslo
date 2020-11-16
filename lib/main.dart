import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: (Colors.grey),

        title: Text('TIG169 TODO', style: TextStyle(color: Colors.black, fontSize: 26)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert, 
              color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: 
      _list(),
       floatingActionButton: FloatingActionButton(
         onPressed: () {},
         child: Icon(Icons.add, size: 56), 
         backgroundColor: Colors.grey,
       ),
    );
          
            
  }



  Widget _list() {
    var numbers = [
      'Plugga',
      'Städa',
      'Träna',
      'Laga mat',
      'Handla',
      'Läsa',
      'Yoga',
    ];

    var list = List.generate(1000, (index) => '${numbers[index % 7]}');

    return ListView.builder(
      itemBuilder: (context, index) => _item(list[index]),
      itemCount: 7,
    );
  }

  Widget _item(text) {
    return CheckboxListTile(
      title: Text(text, style: TextStyle(fontSize: 26)),
      secondary: Icon(Icons.cancel),
       value: false,
       onChanged: (val) {},
       controlAffinity: ListTileControlAffinity.leading,
      //subtitle: Text('subtitle'),
    );
  }

   
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey, 
          title: Text('TIG169 TODO', 
          style: TextStyle(color: Colors.black, fontSize: 26),
          ),
          ), 
          body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  
            _nameInputField(),
             Container(
              height: 40,
            ),
           
            _iconRow(),
          ],
        )
        )
        
        );
    
  }

      

  Widget _nameInputField() {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 25),
      child: TextField(
        decoration: InputDecoration(hintText: 'What are you going to do?'),
      ),
    );
  }

  

  Widget _iconRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(          
         // margin: EdgeInsets.only(left: 10, right: 10),
          child: Icon(Icons.add),
        ),
        Column(         
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('ADD', style: TextStyle(fontSize: 20)),
            
          ],
        ),
      ],
    );
  }

 
}