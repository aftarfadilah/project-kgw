import 'package:flutter/material.dart';

class LoginRegister extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Login'),
    Tab(text: 'Daftar'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: new Image.asset(
              'assets/brand-alt.png',
              fit: BoxFit.contain,
            ),
            bottom: TabBar(
              tabs: myTabs,
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.black,
              indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(
                  color: Colors.white,
                  width: 42,
                )),
                gradient: LinearGradient(colors: [
                  Colors.lightBlueAccent,
                  Colors.blue,
                ]),
              ),
            ),
            backgroundColor: Colors.white,
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: MyCustomForm(),
              ),
              Text('Daftar'),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  FocusNode _focus = new FocusNode();
  double _elevation = 5;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      if (_focus.hasFocus)
        _elevation = 20;
      else
        _elevation = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: ClipRect(
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Kode Guru",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    //TODO: Create custom Text Field Widget
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      elevation: _elevation,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Text tidak boleh kosong';
                            }
                            return null;
                          },
                          //TODO: Add elevation when focused
//                          focusNode: _focus,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Password",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    //TODO: Create custom Text Field Widget
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(10),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Text tidak boleh kosong';
                              }
                              return null;
                            },
                            //TODO: Add elevation when focused
                            focusNode: _focus,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
//                TODO: Create custom gradient button widget
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.blue,
                          ],
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                        ),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: MaterialButton(
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Mantap"),
                        ));
                      },
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      minWidth: 200,
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
