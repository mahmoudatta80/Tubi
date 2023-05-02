import 'package:flutter/material.dart';
import 'package:movie_app/layout/layout.dart';
import 'package:movie_app/modules/login&register/register.dart';
import 'package:movie_app/shared/network/local/state_management/my_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
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
                  'Sign in',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign in to your account',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<MyProvider>(
                  builder: (context, myProvider, child) => Column(
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
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Theme.of(context).primaryColor,
                            value: myProvider.value,
                            activeColor: Theme.of(context).primaryColorLight,
                            onChanged: (value) {
                              myProvider.handleCheckBox(value as bool);
                            },
                          ),
                          Text(
                            'Remember Me',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const Spacer(),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.grey.shade300),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
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
                          Navigator.of(context).push(
                            PageTransition(
                              child: const Layout(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'OR',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 17,
                            backgroundImage: const AssetImage(
                              'assets/images/git.png',
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 17,
                            backgroundImage: const AssetImage(
                              'assets/images/chrome.png',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'if you haven\'t an account',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.grey.shade300),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageTransition(
                                  child: const Register(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Text(
                              'Register now',
                              style: TextStyle(
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
