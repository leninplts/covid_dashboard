import 'package:flutter/material.dart';
import 'package:flutter_covid/screens/screens.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class FirstTriajeScreen extends StatefulWidget {
  @override
  _FirstTriajeScreenState createState() {
    return _FirstTriajeScreenState();
  }
}

  class _FirstTriajeScreenState extends State<FirstTriajeScreen> {
    // Create a global key that uniquely identifies the Form widget
    // and allows validation of the form.
    //
    // Note: This is a GlobalKey<FormState>,
    // not a GlobalKey<MyCustomFormState>.
    final _formKeyTriaje1 = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
      // Build a Form widget using the _formKey created above.
      return Material(
        color: Colors.deepPurpleAccent[100],
        child: Form(
          key: _formKeyTriaje1,
          child: Container(
            //color: Colors.white,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            
              //child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 70.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 1:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('Le haremos algunas preguntas para comprobar si podría ser coronavirus y le diremos qué hacer a continuación.',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondTriajeScreen()),
                            );
                          },
                          child: Text('Empezar ahora',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      /*new Text('Registrese',
                        style: new TextStyle(color: Colors.blue, fontSize: 15.0),
                      ),*/
                      ),
                      new Padding(padding: EdgeInsets.only(top:20.0)),
                      Flexible(
                        //padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/images/medico.png',
                              width: 200,
                              height: 200,
                              //fit: BoxFit.contain,
                            ),
                          ]
                        ),
                      ),
                    
                  ],
                ),
              //),
          )
        )
      );
    }
  }

class SecondTriajeScreen extends StatefulWidget {
  @override
  _SecondTriajeScreenState createState() {
    return _SecondTriajeScreenState();
  }
}

  class _SecondTriajeScreenState extends State<SecondTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje2 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    int group = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
    ..addListener(() {
      setState(() {});
    });

    _focusNodeAge.addListener(() {
      if (_focusNodeAge.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    _focusNodeAge.dispose();

    super.dispose();
  }  

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },  
        //color: Colors.deepPurpleAccent[100],
        child: Form(
          key: _formKeyTriaje2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 60.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 2:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿Cuál es tu nombre?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Nombres y Apellidos",
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
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('Sexo:',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: group,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group = T;
                            });
                          },
                        ),
                        new Text('Masculino',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 15.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: group,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group = T;
                            });
                          },
                        ),
                        new Text('Femenino',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 15.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      SizedBox(height: _animation.value),
                        new Text('Edad:',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                        ),
                        new Padding(padding: EdgeInsets.only(left: 20.0)),
                        Container(
                          width: 100,
                          child:TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Ej. 21",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Obligatorio';
                              }
                              return null;
                            },
                            //focusNode: _focusNodeAge,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje2.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ThirdTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

class ThirdTriajeScreen extends StatefulWidget {
  @override
  _ThirdTriajeScreenState createState() {
    return _ThirdTriajeScreenState();
  }
}

  class _ThirdTriajeScreenState extends State<ThirdTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje3 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
    ..addListener(() {
      setState(() {});
    });

    _focusNodeAge.addListener(() {
      if (_focusNodeAge.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    _focusNodeAge.dispose();

    super.dispose();
  }  

    @override
    Widget build(BuildContext context) {
      // Build a Form widget using the _formKey created above.
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        }, 
        child: Form(
          key: _formKeyTriaje3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            //margin: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
              left: 20,
              top: 80,
              right: 20,
              bottom: 20,
            ),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 3:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿En qué ciudad o distrito se encuentra?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('Necesitamos saber dónde se encuentra para poder encontrar servicios que lo ayuden.  ',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje3.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FourthTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

class FourthTriajeScreen extends StatefulWidget {
  @override
  _FourthTriajeScreenState createState() {
    return _FourthTriajeScreenState();
  }
}

  class _FourthTriajeScreenState extends State<FourthTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje4 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    @override
      void initState() {
        super.initState();

        _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

        _focusNodeAge.addListener(() {
          if (_focusNodeAge.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      }
    @override
    void dispose() {
      _controller.dispose();
      _focusNodeAge.dispose();

      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        }, 
        child: Form(
          key: _formKeyTriaje4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
              left: 20,
              top: 90,
              right: 20,
              bottom: 20,
            ),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 100.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 4:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿En qué trabaja usted?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿A qué se dedica? ¿Cuál es su trabajo u oficio?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Oficio actual",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje4.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => FifthTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

class FifthTriajeScreen extends StatefulWidget {
  @override
  _FifthTriajeScreenState createState() {
    return _FifthTriajeScreenState();
  }
}

  class _FifthTriajeScreenState extends State<FifthTriajeScreen> {
    final _formKeyTriaje5 = GlobalKey<FormState>();
    int group5 = 1;
    @override
    Widget build(BuildContext context) {
      return Material(
        color: Colors.deepPurpleAccent[100],
        child: Form(
          key: _formKeyTriaje5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 100.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 5:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿Ha estado en contacto con alguna persona con COVID-19 o caso sospechoso?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: group5,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group5 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: group5,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group5 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje5.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SixthTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
      );
    }
  }

  class SixthTriajeScreen extends StatefulWidget {
  @override
  _SixthTriajeScreenState createState() {
    return _SixthTriajeScreenState();
  }
}

  class _SixthTriajeScreenState extends State<SixthTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje6 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    int group6 = 1;

    @override
      void initState() {
        super.initState();

        _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

        _focusNodeAge.addListener(() {
          if (_focusNodeAge.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      }
    
    @override
    void dispose() {
      _controller.dispose();
      _focusNodeAge.dispose();

      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        }, 
        child: Form(
          key: _formKeyTriaje6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 20,
            ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 70.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 6:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿Usted sufre de alguna enfermedad?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: group6,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group6 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: group6,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group6 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    //if (group6 == 1) {
                      new Text('En caso de que su respuesta fue afirmativa, especifique cuál.',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                      ),
                    //},
                    
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enfermedad",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje6.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SeventhTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

  class SeventhTriajeScreen extends StatefulWidget {
  @override
  _SeventhTriajeScreenState createState() {
    return _SeventhTriajeScreenState();
  }
}

  class _SeventhTriajeScreenState extends State<SeventhTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje6 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    int group7 = 1;
    @override
      void initState() {
        super.initState();

        _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

        _focusNodeAge.addListener(() {
          if (_focusNodeAge.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      }
    @override
    void dispose() {
      _controller.dispose();
      _focusNodeAge.dispose();

      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKeyTriaje6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 20,
            ),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 7:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿Es alérgico a algún medicamento o alimento?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: group7,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group7 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: group7,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group7 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('En caso de que su respuesta fue afirmativa, especifique cuál.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black, 
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Medicamento",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje6.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EigthTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

class EigthTriajeScreen extends StatefulWidget {
  @override
  _EigthTriajeScreenState createState() {
    return _EigthTriajeScreenState();
  }
}

  class _EigthTriajeScreenState extends State<EigthTriajeScreen> with SingleTickerProviderStateMixin{
    final _formKeyTriaje6 = GlobalKey<FormState>();
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    int group8 = 1;
    @override
      void initState() {
        super.initState();

        _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

        _focusNodeAge.addListener(() {
          if (_focusNodeAge.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      }
    @override
    void dispose() {
      _controller.dispose();
      _focusNodeAge.dispose();

      super.dispose();
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        }, 
        child: Form(
          key: _formKeyTriaje6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
                left: 20,
                top: 30,
                right: 20,
                bottom: 20,
            ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 70.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 8:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('¿Recibe alguna medicación?',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: group8,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group8 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: group8,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              group8 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('En caso de que su respuesta fue afirmativa, especifique cuál.',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black, 
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Medicamento",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_formKeyTriaje6.currentState.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NinethTriajeScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

class NinethTriajeScreen extends StatefulWidget {
  @override
  _NinethTriajeScreenState createState() {
    return _NinethTriajeScreenState();
  }
}

  class _NinethTriajeScreenState extends State<NinethTriajeScreen> {
    bool _checked1 = false;
    bool _checked2 = false;
    bool _checked3 = false;
    bool _checked4 = false;
    bool _checked5 = false;
    bool _checked6 = false;
    bool _checked7 = false;

    final _formKeyTriaje9 = GlobalKey<FormState>();
    int group9 = 1;
    
    @override
    Widget build(BuildContext context) {
      return Material(
        color: Colors.deepPurpleAccent[100],
        child: Form(
          key: _formKeyTriaje9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Paso 9:',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                        color: Colors.red, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('Coronavirus (COVI-19)',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    new Text('Si tiene más de un síntoma, elija el que más le moleste hoy. (Puede elegir más de uno)',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black, 
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                      new CheckboxListTile(
                        title: Text("Tos"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked1,
                        onChanged: (bool newValue1){
                          setState(() {
                            _checked1 = newValue1;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("Fiebre"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked2,
                        onChanged: (bool newValue2){
                          setState(() {
                            _checked2 = newValue2;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("No puede oler ni saborear nada, o las cosas huelen o saben diferente a lo normal"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked3,
                        onChanged: (bool newValue3){
                          setState(() {
                            _checked3 = newValue3;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("Dificultad respiratoria"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked4,
                        onChanged: (bool newValue4){
                          setState(() {
                            _checked4 = newValue4;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("Malestar general"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked5,
                        onChanged: (bool newValue5){
                          setState(() {
                            _checked5 = newValue5;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("Se cansa rápidamente al realizar sus actividades"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked6,
                        onChanged: (bool newValue6){
                          setState(() {
                            _checked6 = newValue6;
                          });
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                      new CheckboxListTile(
                        title: Text("Ninguno de esos"),
                        controlAffinity: 
                        ListTileControlAffinity.platform,
                        value: _checked7,
                        onChanged: (bool newValue7){
                          setState(() {
                            _checked7 = newValue7;
                          });
                          print(_checked7);
                        },
                        activeColor: Colors.deepPurple,
                        checkColor: Colors.white,
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            if (_checked7) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Circuit2FirstScreen()),
                              );
                            }
                            else{
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Circuit1FirstScreen()),
                              );
                            }
                          },
                          child: Text('Siguiente',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
      );
    }
  }

class Circuit1FirstScreen extends StatefulWidget {
  @override
  _Circuit1FirstScreenState createState() {
    return _Circuit1FirstScreenState();
  }
}

  class _Circuit1FirstScreenState extends State<Circuit1FirstScreen> {

    int group9 = 1;
    
    @override
    Widget build(BuildContext context) {
      return Material(
        color: Colors.deepPurpleAccent[100],
        child: Form(
          //key: _formKeyTriaje9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 160.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Ahora le haremos preguntas sobre sus sintomas. Algunos pueden no parecer relevantes pero nos ayudan a descartar cosas. Primero descartamos condiciones graves. No obtendra un diagnostico, pero descubrira que hacer a continuacion.',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Circuit1SecondScreen()),
                            );
                          },
                          child: Text('Si, entiendo',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
      );
    }
  }

class Circuit1SecondScreen extends StatefulWidget {
  @override
  _Circuit1SecondScreenState createState() {
    return _Circuit1SecondScreenState();
  }
}

  class _Circuit1SecondScreenState extends State<Circuit1SecondScreen> {

    int groupcircuit1_1 = 1;
    int groupcircuit1_2 = 1;
    int groupcircuit1_3 = 1;
    int groupcircuit1_4 = 1;
    
    @override
    Widget build(BuildContext context) {
      return Material(
        color: Colors.deepPurpleAccent[100],
        child: Form(
          //key: _formKeyTriaje9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            //padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('¿Tiene sensación de ahogamiento o siente que le es difícil respirar hondo por la boca o lo hace con mucho esfuerzo? ¿Nota que respira muy rápido?',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: groupcircuit1_1,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_1 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          groupValue: groupcircuit1_1,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_1 = T;
                            });
                          },
                        ),
                        new Text('No estoy seguro',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.left,
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: groupcircuit1_1,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_1 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('¿Tiene algún dolor en el pecho o en la parte superior de la espalda en este momento? También puede sentir dolor en los brazos, hombros, cuello o mandíbula. Esto no es lo mismo que sentirse adolorido por toser demasiado.',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: groupcircuit1_2,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_2 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          groupValue: groupcircuit1_2,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_2 = T;
                            });
                          },
                        ),
                        new Text('No estoy seguro',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.left,
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: groupcircuit1_2,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_2 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('¿Está tan enfermo que ha dejado de realizar todas sus actividades diarias habituales? Esto significa cosas que normalmente haría todos los días, como levantarse de la cama, ducharse, vestirse, mirar televisión o leer un libro.',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: groupcircuit1_3,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_3 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          groupValue: groupcircuit1_3,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_3 = T;
                            });
                          },
                        ),
                        new Text('No estoy seguro',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.left,
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: groupcircuit1_3,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_3 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('¿Tiene una o más manchas o marcas nuevas, como moretones o sangrado debajo de la piel? Buscamos signos de meningitis o sepsis. La mancha o manchas pueden ser marcas de pinchazos de color rojo, azul, violeta o marrón que pueden convertirse en manchas oscuras más grandes. En pieles oscuras es más fácil de ver en áreas más pálidas. ',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 40.0)),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: groupcircuit1_4,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_4 = T;
                            });
                          },
                        ),
                        new Text('Si',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 2,
                          groupValue: groupcircuit1_4,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_4 = T;
                            });
                          },
                        ),
                        new Text('No estoy seguro',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.left,
                      children: <Widget>[
                        new Radio(
                          value: 3,
                          groupValue: groupcircuit1_4,
                          onChanged: (T) {
                            print(T);
                            setState((){
                              groupcircuit1_4 = T;
                            });
                          },
                        ),
                        new Text('No',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            color: Colors.black, 
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                      children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text('Acceder a la videollamada',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ],
                      ),
                      //new Padding(padding: EdgeInsets.only(top:20.0)),
                  ],
                ),
              ),
          )
        )
      );
    }
  }

class Circuit2FirstScreen extends StatefulWidget {
  @override
  _Circuit2FirstScreenState createState() {
    return _Circuit2FirstScreenState();
  }
}

  class _Circuit2FirstScreenState extends State<Circuit2FirstScreen> with SingleTickerProviderStateMixin{
    int group9 = 1;
    AnimationController _controller;
    Animation _animation;
    FocusNode _focusNodeAge = FocusNode();
    @override
      void initState() {
        super.initState();

        _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
        _animation = Tween(begin: 70.0, end: 70.0).animate(_controller)
        ..addListener(() {
          setState(() {});
        });

        _focusNodeAge.addListener(() {
          if (_focusNodeAge.hasFocus) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        });
      }
    @override
    void dispose() {
      _controller.dispose();
      _focusNodeAge.dispose();

      super.dispose();
    }  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.deepPurpleAccent[100],
        resizeToAvoidBottomInset: true,
        body: new InkWell(    
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.only(
                left: 20,
                top: 20,
                right: 20,
                bottom: 20,
            ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(top: 160.0)),
                    new Text('Verificador de síntomas en línea',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.deepPurple, 
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 50.0)),
                    new Text('Como no seleccionó ninguno de los síntomas, ES POCO PROBABLE QUE TENGA COVID-19. Aun así lo contactaremos con un doctor para que le brinde más información general sobre Covid-19.',
                      textAlign: TextAlign.justify,
                      style: new TextStyle(
                        color: Colors.black, 
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    ),
                    new Padding(padding: EdgeInsets.only(top: 30.0)),
                    TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Celular",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.yellow,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text('Si, deseo una consulta con un médico',
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: RaisedButton(
                          elevation:5.0,
                          color: Colors.black,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text('No, gracias',
                            style: new TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ),
                      //],
                    //),
                  ],
                ),
              ),
          )
        )
        ),
      );
    }
  }

