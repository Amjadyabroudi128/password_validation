import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  bool isSuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isSuccess? Colors.green : Colors.red,
        centerTitle: true,
        title: Text("Password Validation",),

      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
                SizedBox(height: 20.h,),
              Icon(
                isSuccess? Icons.lock_open : Icons.lock,
                color: isSuccess ? Colors.green : Colors.red,
                size: 50.h,
              ),
              SizedBox(height: 60.h,),
              Icon(
                isSuccess? Icons.check : Icons.close,
                color: isSuccess ? Colors.green : Colors.red,
                size: 50.h,
              ),
              SizedBox(height: 60.h,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
                    hintText: "password",
                  ),
                ),

              ),
              SizedBox(
                child: FlutterPwValidator(
                  controller: controller,
                  uppercaseCharCount: 1,
                    specialCharCount: 1,
                    numericCharCount: 1,
                    width: 350.w, height: 99.h,
                    minLength: 8,
                    onSuccess: (){
                    setState(() {
                      isSuccess = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password is right")));
                    },
                    onFail: (){
                    setState(() {
                      isSuccess = false;
                    });

                    },
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
