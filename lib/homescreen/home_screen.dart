
import 'package:flutter/material.dart';


import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int index =0;
List<HomeModel> cars = [
  HomeModel(
    name: "BMW",
    image:AssetImage("assets1.jpg"),
    icon: Icon(Icons.share),
    subtitle: "this is car"
  ),
  HomeModel(
    name: "swift",
    image:AssetImage("assets2.jpg"),
    icon: Icon(Icons.share),
    subtitle: "this is car"
  ),HomeModel(
    name: "AUDI",
    image:AssetImage("assets3.jpg"),
    icon: Icon(Icons.share),
    subtitle: "this is car"
  ),
];

  get children => null;
  @override
  Widget build(BuildContext context) {


return Scaffold(
  appBar: AppBar(
title: const Text("project"),
backgroundColor: Colors.blue,
centerTitle: true,
leading: IconButton(
  icon:Icon(Icons.arrow_back),
  onPressed: (){
    print("leading clicked");
  }, ),
  actions: [
    IconButton(onPressed:(){
      print("refresh clicked");
    },
     icon: const Icon(Icons.refresh)),
     GestureDetector(
      onTap: ()
         {
          print("menu clicked");
        },
      child: const Center(child: Text("menu"),),
     )
  ],
  
  ),
   endDrawer: Drawer(
    backgroundColor:Colors.cyan,
    child:Column(
      crossAxisAlignment: 
      CrossAxisAlignment.end,
      children:[
        SizedBox(height:40,width: 40,
        ),
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.pink,
        ),
        SizedBox(
          height: 10,width: 10,
        ),
        Text("anisha",
        style: TextStyle(
           color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold),
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
        ListTile(
          leading: 
          CircleAvatar(),
          // ignore: prefer_const_constructors
          
          title: Text("Home"),
          subtitle: Text("this is a home screen"),
          trailing: Icon(Icons.home),
          isThreeLine: true,
        ),
        ListTile(
          leading: 
          CircleAvatar(),
          
          title: Text("settings"),
          subtitle: Text("this is a home screen"),
          trailing: Icon(Icons.settings),
          isThreeLine: true,
        ),ListTile(
          leading: 
          CircleAvatar(),
          
          title: Text("profile"),
          subtitle: Text("this is a home screen"),
          trailing: Icon(Icons.person),
          isThreeLine: true,
        ),
        ListTile(
          leading: 
          CircleAvatar(),
          
          title: Text("share"),
          subtitle: Text("this is a home screen"),
          trailing: Icon(Icons.share),
          isThreeLine: true,
        ),
      ]
        ),
        
 
   
   Divider(
    color: Colors.white,
  thickness: 2,
  )
  // ignore: dead_code
  ElevatedButton(onPressed: () {
    print("signout clicked");
  },
  child: Text("sign out"),
  );
bottomNavigationBar: 

BottomNavigationBar(
  currentIndex: index,
  backgroundColor:Colors.green,
  onTap: (value) {
    setState(() {
      index=value;
      print(index);
    });

  },
items:const[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "home",
    backgroundColor: Colors.black,
    activeIcon: Icon(
      Icons.home,
      size: 40,
      color: Colors.white,

    ),
    tooltip: "home"
  ),
   BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: "profile",
    backgroundColor: Colors.black,
    activeIcon: Icon(
      Icons.person,
      size: 40,
      color: Colors.white,

    ),
    tooltip: "profile"
  ), BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "settings",
    backgroundColor: Colors.black,
    activeIcon: Icon(
      Icons.settings,
      size: 40,
      color: Colors.white,

    ),
    tooltip: "settings"
  ),
]
),
body:
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children[Expanded(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10
          itemCount: cars.length,
          itemBuilder: (context, index){
            return GridTile(
              child: Column(
                children: [
                  
                    child: CircleAvatar(
                      backgroundImage: cars[index].image,
                      radius: 30,
                    ),
                    Text(cars[index].name),
                    Text(cars[index].subtitle),
                    Container(
                      child: cars[index].icon,)
                ],),)
          }
          ),
          children: [
GridTile(child: Column(
  children: [
    Container(
      color: Colors.pink,
      child: Image(image: AssetImage("assets1.jpg")),
    )
  ],
)),
children: [
GridTile(child: Column(
  children: [
    Container(
      color: Colors.pink,
      child: Image(image: AssetImage("assets2.jpg")),
    )
  ],
)),
],
children: [
GridTile(child: Column(
  children: [
    Container(
      color: Colors.pink,
      child: Image(image: AssetImage("assets3.jpg")),
    )
  ],
)),
            GridTile(child: Image(image: AssetImage("assets1.jpg"))),
            GridTile(child: Image(image: AssetImage("assets2.jpg"))),
            GridTile(child: Image(image: AssetImage("assets3.jpg"))),

          ],
          ],
      ),
    Expanded(
     child: GridView(
      gridDelegate:
    SilverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    children: const [
      GridTile(child:Image(image: AssetImage("assets1.jpg"))),
      GridTile(child:Image(image: AssetImage("assets2.jpg"))),
      GridTile(child:Image(image: AssetImage("assets3.jpg"))),

    ],
     ),
     )
  )
  


         
              Column(
                children: [
                  Expanded(
                      
                       child: ListView.builder(
                  
                        itemCount: cars.length,
                  
                        itemBuilder: (context, i){
                  
                        return ListTile(
                  
        leading: CircleAvatar(
                  
                  backgroundImage: cars[i].image,
                  
         ),
                  
        title: Text(cars[i].name),
                  
        subtitle: Text("${cars[i].subtitle}"),
                  
        trailing: cars[i].icon,
                  
                        );
                  
                        },
                  
                        ),
                      
                    ),
                ],
              ),
  ],
)
   
    
    )
    );
  
  
  
  



  
  }

  
}
  
  
  
  
  
  
  
  