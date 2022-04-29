import 'dart:ffi';

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

import 'package:foodapp/model/RestaurantModel.dart';
import 'package:foodapp/screens/restaurant_home.dart';
import 'package:foodapp/state/main_state.dart';
import 'package:foodapp/strings/main_strings.dart';
import 'package:foodapp/view_model/main_vm/main_view_model_imp.dart';
import 'package:foodapp/widgets/main/main_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common/common_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp(app:app));
}

class MyApp extends StatelessWidget {
  final FirebaseApp app;
  MyApp({required this.app});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(app:app),
    );
  }
}

class MyHomePage extends StatelessWidget{
  final FirebaseApp app;
  final viewModel = MainViewModelImp();
  final mainStateController = Get.put(MainStateController());
  MyHomePage({required this.app});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text(RESTAURANT_REF,style: GoogleFonts.jetBrainsMono(
       color:Colors.black,fontWeight: FontWeight.w900,
     ),),
     backgroundColor: Colors.white,
     foregroundColor: Colors.black,
     elevation: 10,),
     body: FutureBuilder(
       // ignore: deprecated_member_use
       future: viewModel.displayRestaurantList(),
       builder: (context,snapshot){
         if(snapshot.connectionState == ConnectionState.waiting) {
           return Center(child: CircularProgressIndicator(),);
         } else {
          var lst = snapshot.data as List<RestaurantModel>;

              return  Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: LiveList(
                    showItemDuration: Duration(milliseconds: 350),
                    showItemInterval: Duration(milliseconds: 150),
                    reAnimateOnVisibility: true,
                    scrollDirection: Axis.vertical,
                    itemCount: lst.length,
                    itemBuilder: animationItemBuilder((index)=>InkWell(
                      onTap: (){
                        mainStateController.selectedRestaurant.value = lst[index];
                        Get.to(()=>RestaurantHome());
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/2.5*1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          RestaurantImageWidget(imageUrl: lst[index].imageUrl),
                          RestaurantInfoWidget(name: lst[index].name,address : lst[index].address)

                            ],
                        ),
                      ),
                    ),
                    ),
                  ));


         }
       },
     ),
   );
  }
}



