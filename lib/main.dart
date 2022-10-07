import 'package:discount/presenter/discount_presenter.dart';
import 'package:discount/presenter/discount_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discount Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Discount Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _valueController, _discountController;
  DiscountProvider _discountProvider;

  @override
  void initState() {
    _valueController = TextEditingController();
    _discountController = TextEditingController();
    _discountProvider = DiscountPresenter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          _buildTextField(
              "Digite o valor inicial", _valueController, Key('initValue')),
          _buildTextField("Digite o valor do desconto", _discountController,
              Key('discountValue')),
          _buildCalculateButton("Calcular valor final"),
          StreamBuilder<String>(
            stream: _discountProvider.outController,
            builder: (context, snapshot) {
              return Text(
                snapshot.data ?? "",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget _buildTextField(
      String labelText, TextEditingController controller, Key key) {
    return Container(
      width: 300,
      child: TextField(
        key: key,
        controller: controller,
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(labelText: labelText),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildCalculateButton(String textButton) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: RaisedButton(
        child: Text(
          textButton,
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        onPressed: () {
          _discountProvider.obtainFinalValue(
            _valueController.text,
            _discountController.text,
          );
        },
      ),
    );
  }
}
