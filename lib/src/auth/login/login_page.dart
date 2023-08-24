import 'package:flutter/material.dart';
import 'package:telegram_clone/src/const/utils/app_colors.dart';
import 'package:telegram_clone/src/models/text_style.dart';
import 'package:telegram_clone/src/models/textfiled_model.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    var media=MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: IconButton(onPressed: (){},icon: const Icon(Icons.arrow_back),),
        ),
        shape:  const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.C_36B8B8),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
        ),
        toolbarHeight: media.size.height*200/640,
        backgroundColor: AppColors.C_36B8B8,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: media.size.height*36/640,),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter your name';
                  }
                },
              controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: TextFormFiledModel.items(text: 'Enter your name'),
              ),
              SizedBox(height: media.size.height*24/640,),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter your user';
                  }
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: TextFormFiledModel.items(text: 'Enter your email'),
              ),
              SizedBox(height: media.size.height*24/640,),
              TextFormField(
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Enter your password';
                  }
                },
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: TextFormFiledModel.items(text: 'Enter your password',
                suffixIcon: Icons.visibility,
                ),
              ),
              SizedBox(height: media.size.height*68/640,),
               ElevatedButton(
                   style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55),
                     backgroundColor: AppColors.C_36B8B8,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(25),
                     )
                   ),
                   onPressed: (){}, child: TextStyleModel.items(text: 'Login', size: 15)),
            ],
          ),
        ),
      ),
    );
  }
}
