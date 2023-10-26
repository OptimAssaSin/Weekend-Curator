import 'package:flutter/material.dart';
import 'package:practice/FirstPage.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map userData = {};
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: Text(
                    'Weekend  Curator',
                    style: TextStyle(fontSize: 29),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextFormField(
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Enter email address'),
                                    EmailValidator(
                                        errorText:
                                            'Please correct email filled'),
                                  ]),
                                  decoration: const InputDecoration(
                                      hintText: 'Email',
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.email,
                                        //color: Colors.green,
                                      ),
                                      errorStyle: TextStyle(fontSize: 18.0),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9.0)))))),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Please enter Password'),
                                MinLengthValidator(8,
                                    errorText:
                                        'Password must be atlist 8 digit'),
                                PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                    errorText:
                                        'Password must be atlist one special character')
                              ]),
                              decoration: const InputDecoration(
                                hintText: 'Password',
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                                errorStyle: TextStyle(fontSize: 18.0),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9.0))),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(180, 0, 0, 0),
                            child: const Text('Forget Password!'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              child: ElevatedButton(
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    print('form submiitted');
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FirstPage()));
                                  }
                                },
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                              child: Center(
                                child: Text(
                                  'Or Sign In Using!',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  children: [],
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 50),
                              child: const Text(
                                'SIGN UP!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.lightBlue,
                                ),
                              ),
                            ),
                          )
                        ]),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
