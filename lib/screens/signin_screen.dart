import 'package:flutter/material.dart';
import 'package:instgram_clone/constant/Colors.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff323A99), Color(0xffF98BFC)],
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [_getImageContainer(), _getContainerBox(context)],
          ),
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 80,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/images/signin_rocket.png'),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    );
  }

  Widget _getContainerBox(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 50, left: 44, right: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign in to ',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Image(image: AssetImage('assets/images/signin_logo.png'))
                    ],
                  ),
                  SizedBox(height: 26),
                  SizedBox(
                    height: 46.0,
                    child: TextField(
                      focusNode: emailFocusNode,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: GreyColor, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 3),
                        ),
                        labelText: ' Email ',
                        labelStyle: TextStyle(
                          color: emailFocusNode.hasFocus
                              ? secondaryColor
                              : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  SizedBox(
                    height: 46,
                    child: TextField(
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide: BorderSide(color: GreyColor, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          borderSide:
                              BorderSide(color: secondaryColor, width: 3),
                        ),
                        labelText: ' Password ',
                        labelStyle: TextStyle(
                          color: passwordFocusNode.hasFocus
                              ? secondaryColor
                              : Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text(
                      'Signin',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have an Account? / ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16.0,
                          fontFamily: 'GB',
                        ),
                      ),
                      Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'GB',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
