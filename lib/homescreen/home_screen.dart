
import 'package:first_project/model/form_builder_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  String username;
  String password;
  String gender;
   HomeScreen({
    required this.username,
    required this.password,
    required this.gender,
   Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int index = 0;
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
  // actions: [
  //   IconButton(onPressed:(){
  //     print("refresh clicked");
  //   },
    //  icon: const Icon(Icons.refresh)),
    //  GestureDetector(
    //   onTap: ()
    //      {
    //       print("menu clicked");
    //     },
    //   child: const Center(child: Text("menu"),),
    //  )
  
  ),
  
   endDrawer: Drawer(
    backgroundColor:Colors.cyan,
    child:SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          SizedBox(height:40,width: 40,
          ),
          Center(
            child: CircleAvatar(
              radius: 40,
              
              backgroundColor: Colors.pink,
            ),
          ),
          SizedBox(
            height: 5,width: 5,
          ),
          Center(
            child: Text(
              widget.username +"\n"+ widget.gender,
             
            style: TextStyle(
              
               color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
            ),
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
        
        
        SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.white,
  thickness: 2,
  ),
       SizedBox(
        height: 5,
        ),
   
  
  
        Center(
          child: ElevatedButton(onPressed: () async{
            print("SignOut clicked");
            SharedPreferences userPrefs = await SharedPreferences.getInstance();
            userPrefs.remove('UserInfo');
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: ((context) => FormBuilderScreen()
                )));
          },
          child: Text("sign out"),
          
          ),
        ),
        ],
      ),
    ),
   ),
  
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
  
  children:[
    Expanded(
      
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10
        ),
          itemCount: cars.length,
          itemBuilder: (context, index){
            return GridTile(
              child: Column(
                children: [
                  Container(
                    child: CircleAvatar(
                      backgroundImage: cars[index].image,
                      radius: 30,
                    ),
                  ),
                  Container(
                    child: Text(cars[index].name),
                  ),
                  Container(
                    child: Text(cars[index].subtitle),
                  ),
                    Container(
                      child: cars[index].icon,
                      ),
                ],
                ),
                );
          }
          ),
    ),
  
// Expanded(
//   child:   Column(
  
//     children: [
  
//           GridTile(child: Column(
  
      
  
//         children: [
  
      
  
//           Container(
  
      
  
//           color: Colors.pink,
  
      
  
//             child: Image(image: AssetImage("assets1.jpg")),
  
      
  
//           )
  
      
  
//         ],
  
      
  
//       )),
  
    
  
  
  
//   GridTile(child: Column(
  
//     children: [
  
//       Container(
  
//         color: Colors.pink,
  
//         child: Image(image: AssetImage("assets2.jpg")),
  
//       )
  
//     ],
  
//   )),
  
  
  
//   GridTile(child: Column(
  
//     children: [
  
//       Container(
  
//         color: Colors.pink,
  
//         child: Image(image: AssetImage("assets3.jpg")),
  
//       )
  
//     ]
  
//   )),
  
             
  
  
  
    
  
        
  
      
  
        
  
              //  GridTile(child:Image(image: AssetImage("assets1.jpg"))),
  
              //  GridTile(child:Image(image: AssetImage("assets2.jpg"))),
  
              //  GridTile(child:Image(image: AssetImage("assets3.jpg"))),
  
        
  
              
  
//     ]
  
//   ),
// ), 

  


         
             
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
                  
                        }
                  
                       ),
                      
                  )
  ],
),
              );
              
  }}