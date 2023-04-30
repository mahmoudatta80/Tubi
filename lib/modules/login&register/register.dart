import 'package:flutter/material.dart';
import 'package:movie_app/layout/layout.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text(
                  'Register',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create your account',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      cursorColor: Theme.of(context).primaryColorLight,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        label: Text(
                          'User Name',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        fillColor: Theme.of(context).primaryColorLight,
                        focusColor: Theme.of(context).primaryColorLight,
                        hoverColor: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      cursorColor: Theme.of(context).primaryColorLight,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        label: Text(
                          'Email',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        fillColor: Theme.of(context).primaryColorLight,
                        focusColor: Theme.of(context).primaryColorLight,
                        hoverColor: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: phoneController,
                      cursorColor: Theme.of(context).primaryColorLight,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        label: Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                        fillColor: Theme.of(context).primaryColorLight,
                        focusColor: Theme.of(context).primaryColorLight,
                        hoverColor: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Consumer<MyProvider>(
                      builder: (context, myProvider, child) => TextFormField(
                        controller: passwordController,
                        cursorColor: Theme.of(context).primaryColorLight,
                        obscureText: !myProvider.isPasswordShown,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              color: Theme.of(context).highlightColor,
                            ),
                          ),
                          fillColor: Theme.of(context).primaryColorLight,
                          focusColor: Theme.of(context).primaryColorLight,
                          hoverColor: Theme.of(context).primaryColorLight,
                          suffixIcon: IconButton(
                            onPressed: () {
                              myProvider.changePasswordVisibility();
                            },
                            icon: myProvider.isPasswordShown
                                ? Icon(
                                    Icons.visibility_outlined,
                                    color: Theme.of(context).highlightColor,
                                  )
                                : Icon(
                                    Icons.visibility_off_outlined,
                                    color: Theme.of(context).highlightColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColorLight,
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all(
                          const Size(
                            double.infinity,
                            50,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: const Layout(),
                            type: PageTransitionType.fade,
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'if you have an account',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.grey.shade300),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
