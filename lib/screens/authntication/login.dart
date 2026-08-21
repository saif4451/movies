import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class Homescreen extends StatefulWidget{

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isPhidden = true;
  @override
  Widget build(BuildContext context) {

    final size =MediaQuery.of(context).size;
    double screenwidth= size.width;
    double screenheight= size.height;

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenheight*0.08,
              ),
              Image.asset(AppAssets.logo,width: 118,height: 121,fit: BoxFit.fill,),
            SizedBox(
              height: screenheight*0.08,
            ),
              TextFormField(
        
                style: TextStyle(
                    color: AppColors.whiteColor
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.darkGrey,
                  prefixIcon: Image.asset(AppAssets.emailIcon),
                  hintText: 'Email',
                  border: OutlineInputBorder(
        
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )
        
                ),
              ),
              SizedBox(
                height: screenheight*0.02,
              ),
              TextFormField(
                style: TextStyle(
                  color: AppColors.whiteColor
                ),
                obscureText: isPhidden,
                decoration: InputDecoration(
        
                  filled: true,
                  fillColor: AppColors.darkGrey,
                  suffixIcon: IconButton(
                      onPressed: (){
                      setState(() {
                        isPhidden =! isPhidden;
                      });
                      },
                      icon: Icon(
                    isPhidden ?Icons.visibility_off
                        : Icons.visibility
                  )),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Image.asset(AppAssets.passwordIcon),
                  ),
                  hintText: 'password',
                  border: OutlineInputBorder(
        
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none
                  )
        
                ),
              ),
              SizedBox(height: screenheight*0.02,),
              Align(
                alignment: Alignment.centerRight,
                child: Text('Forget Password?',style: TextStyle(
                  color: AppColors.primaryColor
                )
                ),
              ),
              SizedBox(height: screenheight*0.03,),
              SizedBox(
        
                width: screenwidth*0.9,
                height: screenheight*0.07,
                child: ElevatedButton(onPressed: (){},
                  child:Text('Login',
        
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      backgroundColor:AppColors.primaryColor
                  ),
                ),
        
              ),
              SizedBox(
                height: screenheight*0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don`t Have Account ? ',style: TextStyle(color: Colors.white),),
                  Text('Creat one',style: TextStyle(color:AppColors.primaryColor),)
                ],
              ),
              SizedBox(
                height: screenheight*0.03,
              ),
              Row(
                spacing: 11,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color:AppColors.primaryColor,
                    width: 92,
                    height: 1,
                  ),
                  Text('OR',style: TextStyle(color: AppColors.primaryColor),),
                  Container(
                    color: AppColors.primaryColor,
                    width: 92,
                    height: 1,
                  ),
                ],
              ),
              SizedBox(
                height: screenheight*0.03,
              ),
        
        
        
        
        
        
        
              SizedBox(
        
                width: screenwidth*0.9,
                height: screenheight*0.07,
                child: ElevatedButton(onPressed: (){},
                    child:Row(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image.asset(AppAssets.googleIcon,width: screenwidth*0.06,height: screenheight*0.3,)
                      ,Text('Login With Google',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                        ),
                        )
                      ],
        
                    ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    backgroundColor: AppColors.primaryColor
                  ),
                ),
        
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
// FloatingActionButton(onPressed: (){},
// child: Stack(
// alignment: Alignment.center,
// children: [
// Container(
// width: screenwidth*0.9,
// height: double.infinity,
// decoration: BoxDecoration(
// color: AppClors.primary
// ),
// ),
// Row(
// children: [
// Image.asset(Appassets.googleicon,width: screenwidth*0.06,height: screenheight*0.3,)
// ],
// )
// ],
// ),)