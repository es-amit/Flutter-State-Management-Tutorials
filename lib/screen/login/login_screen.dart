import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    
  final authProvider = Provider.of<AuthProvider>(context); 
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email"
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password"
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap:(){
                authProvider.login(emailController.text.toString(), passwordController.text.toString());
              } ,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red
                ),
                child:  Center(
                  child: authProvider.loading ? const CircularProgressIndicator(color: Colors.white,) : const Text("Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}