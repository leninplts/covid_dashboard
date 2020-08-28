import 'package:flutter/material.dart';
import 'package:flutter_covid/screens/screens.dart';

/*class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'LOGIN',
        home: Scaffold(
          //appBar: AppBar(title: const Text(_title)),
          body: LoginScreen(),
        ),
      );
    }
}*/

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

//class _LoginScreenState extends State<LoginScreen> {
  //String _country = 'PE';
  class _LoginScreenState extends State<LoginScreen> {
    // Create a global key that uniquely identifies the Form widget
    // and allows validation of the form.
    //
    // Note: This is a GlobalKey<FormState>,
    // not a GlobalKey<MyCustomFormState>.
    final _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      // Build a Form widget using the _formKey created above.
      return Material(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Padding(padding: EdgeInsets.only(top: 110.0)),
                  new Text('Ingreso',
                    style: new TextStyle(
                      color: Colors.deepPurpleAccent, 
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                  ),
                  new Padding(padding: EdgeInsets.only(top: 50.0)),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tiene que rellenar este campo';
                      }
                      return null;
                    },
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Contraseña",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Tiene que rellenar este campo';
                      }
                      return null;
                    },
                  ),
                  new Padding(padding: EdgeInsets.only(top: 20.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                    children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        elevation:5.0,
                        color: Colors.deepPurpleAccent,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => BottomNavScreen()),
                            );
                          }
                        },
                        child: Text('Iniciar Sesión',
                          style: new TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 00.0),
                      child: RaisedButton(
                        //elevation:5.0,
                        color: Colors.white,
                        onPressed: () {
                          // Validate returns true if the form is valid, or false
                          // otherwise.
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SigninScreen()),
                          );
                        },
                        child: Text('Registrese',
                          style: new TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ),
                    ],
                    /*new Text('Registrese',
                      style: new TextStyle(color: Colors.blue, fontSize: 15.0),
                    ),*/
                    ),
                    Flexible(
                      //padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/fondo_login.png',
                            width: 330,
                            fit: BoxFit.contain,
                          ),
                        ]
                      ),
                    ),
                  
                ],
              ),
          )
        )
      );
    }
  }
  
//}

//-------------------------------------- REGISTRO ------------------------------

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() {
    return _SigninScreenState();
  }
}

class _SigninScreenState extends State<SigninScreen> {
    // Create a global key that uniquely identifies the Form widget
    // and allows validation of the form.
    //
    // Note: This is a GlobalKey<FormState>,
    // not a GlobalKey<MyCustomFormState>.
    final _formKey1 = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      // Build a Form widget using the _formKey created above.
      return Material(
        //body: CustomScrollView(
        //physics: Cla1mpingScrollPhysics(),
        child: Form(
          key: _formKey1,
          //Flexible(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            //new padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                //padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 110.0)),
                    new Text('Registro',
                      style: new TextStyle(
                        color: Colors.deepPurpleAccent, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Nombres",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Tiene que rellenar este campo';
                        }
                        return null;
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Apellidos",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Tiene que rellenar este campo';
                        }
                        return null;
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Tiene que rellenar este campo';
                        }
                        return null;
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Nro. Celular",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Tiene que rellenar este campo';
                        }
                        return null;
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Dirección",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Tiene que rellenar este campo';
                        }
                        return null;
                      },
                    ),
                    new Padding(padding: EdgeInsets.only(top: 20.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            elevation:5.0,
                            color: Colors.deepPurpleAccent,
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              if (_formKey1.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SigninScreen()),
                                );
                              }
                            },
                            child: Text('Enviar',
                              style: new TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: RaisedButton(
                            elevation:5.0,
                            color: Colors.white,
                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                            child: Text('Log In',
                              style: new TextStyle(color: Colors.deepPurpleAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/fondo_login.png',
                            width: 330,
                            fit: BoxFit.contain,
                          ),
                        ]
                      ),
                    ),*/
                  ],
                ),
              ),
          ),
        //)
      ),
      //),
      );
    }
  }