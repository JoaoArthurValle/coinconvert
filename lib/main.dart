import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://api.hgbrasil.com/finance?key=f075c731";

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();
  final libraController = TextEditingController();
  final pesoController = TextEditingController();
  final cadController = TextEditingController();
  final audController = TextEditingController();
  final yenController = TextEditingController();
  final cnyController = TextEditingController();
  final btcController = TextEditingController();

  double dolar = 0.0;
  double euro = 0.0;
  double libra = 0.0;
  double peso = 0.0;
  double dolar_canadense = 0.0;
  double dolar_australiano = 0.0;
  double yen = 0.0;
  double renminbi = 0.0;
  double bitcoin = 0.0;

  void _clearAll(){
    realController.text = "";
    dolarController.text = "";
    euroController.text = "";
    libraController.text = "";
    pesoController.text = "";
    cadController.text = "";
    audController.text = "";
    yenController.text = "";
    cnyController.text = "";
    btcController.text = "";
  }

  void _realchanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
    libraController.text = (real/libra).toStringAsFixed(2);
    pesoController.text = (real/peso).toStringAsFixed(2);
    cadController.text = (real/dolar_canadense).toStringAsFixed(2);
    audController.text = (real/dolar_australiano).toStringAsFixed(2);
    yenController.text = (real/yen).toStringAsFixed(2);
    cnyController.text = (real/renminbi).toStringAsFixed(2);
    btcController.text = (real/bitcoin).toStringAsFixed(2);

  }

  void _dolarchanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar/euro).toStringAsFixed(2);
    libraController.text = (dolar * this.dolar/libra).toStringAsFixed(2);
    pesoController.text = (dolar * this.dolar/peso).toStringAsFixed(2);
    cadController.text = (dolar * this.dolar/dolar_canadense).toStringAsFixed(2);
    audController.text = (dolar * this.dolar/dolar_australiano).toStringAsFixed(2);
    yenController.text = (dolar * this.dolar/yen).toStringAsFixed(2);
    cnyController.text = (dolar * this.dolar/renminbi).toStringAsFixed(2);
    btcController.text = (dolar * this.dolar/bitcoin).toStringAsFixed(2);
  }

  void _eurochanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro/dolar).toStringAsFixed(2);
    libraController.text = (euro * this.euro/libra).toStringAsFixed(2);
    pesoController.text = (euro * this.euro/peso).toStringAsFixed(2);
    cadController.text = (euro * this.euro/dolar_canadense).toStringAsFixed(2);
    audController.text = (euro * this.euro/dolar_australiano).toStringAsFixed(2);
    yenController.text = (euro * this.euro/yen).toStringAsFixed(2);
    cnyController.text = (euro * this.euro/renminbi).toStringAsFixed(2);
    btcController.text = (euro * this.euro/bitcoin).toStringAsFixed(2);
  }

  void _librachanged(String text){
    if(text.isEmpty){
      _clearAll();
      return;
    }
    double libra = double.parse(text);
    realController.text = (libra * this.libra).toStringAsFixed(2);
    dolarController.text = (libra * this.libra/dolar).toStringAsFixed(2);
    euroController.text = (libra * this.libra/euro).toStringAsFixed(2);
    pesoController.text = (libra * this.libra/peso).toStringAsFixed(2);
    cadController.text = (libra * this.libra/dolar_canadense).toStringAsFixed(2);
    audController.text = (libra * this.libra/dolar_australiano).toStringAsFixed(2);
    yenController.text = (libra * this.libra/yen).toStringAsFixed(2);
    cnyController.text = (libra * this.libra/renminbi).toStringAsFixed(2);
    btcController.text = (libra * this.libra/bitcoin).toStringAsFixed(2);
  }

  void _pesochanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double peso = double.parse(text);
    realController.text = (peso * this.peso).toStringAsFixed(2);
    dolarController.text = (peso * this.peso / dolar).toStringAsFixed(2);
    euroController.text = (peso * this.peso / euro).toStringAsFixed(2);
    libraController.text = (peso * this.peso /libra).toStringAsFixed(2);
    cadController.text = (peso * this.peso / dolar_canadense).toStringAsFixed(2);
    audController.text = (peso * this.peso / dolar_australiano).toStringAsFixed(2);
    yenController.text = (peso * this.peso / yen).toStringAsFixed(2);
    cnyController.text = (peso * this.peso / renminbi).toStringAsFixed(2);
    btcController.text = (peso * this.peso / bitcoin).toStringAsFixed(2);
  }

  void _cadchanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar_canadense = double.parse(text);
    realController.text = (dolar_canadense * this.dolar_canadense).toStringAsFixed(2);
    dolarController.text = (dolar_canadense * this.dolar_canadense / dolar).toStringAsFixed(2);
    euroController.text = (dolar_canadense * this.dolar_canadense / euro).toStringAsFixed(2);
    libraController.text = (dolar_canadense * this.dolar_canadense /libra).toStringAsFixed(2);
    pesoController.text = (dolar_canadense * this.dolar_canadense / peso).toStringAsFixed(2);
    audController.text = (dolar_canadense * this.dolar_canadense / dolar_australiano).toStringAsFixed(2);
    yenController.text = (dolar_canadense * this.dolar_canadense / yen).toStringAsFixed(2);
    cnyController.text = (dolar_canadense * this.dolar_canadense / renminbi).toStringAsFixed(2);
    btcController.text = (dolar_canadense * this.dolar_canadense / bitcoin).toStringAsFixed(2);
  }

  void _audchanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar_australiano = double.parse(text);
    realController.text = (dolar_australiano * this.dolar_australiano).toStringAsFixed(2);
    dolarController.text = (dolar_australiano * this.dolar_australiano / dolar).toStringAsFixed(2);
    euroController.text = (dolar_australiano * this.dolar_australiano / euro).toStringAsFixed(2);
    libraController.text = (dolar_australiano * this.dolar_australiano /libra).toStringAsFixed(2);
    pesoController.text = (dolar_australiano * this.dolar_australiano / peso).toStringAsFixed(2);
    cadController.text = (dolar_australiano * this.dolar_australiano / dolar_canadense).toStringAsFixed(2);
    yenController.text = (dolar_australiano * this.dolar_australiano / yen).toStringAsFixed(2);
    cnyController.text = (dolar_australiano * this.dolar_australiano / renminbi).toStringAsFixed(2);
    btcController.text = (dolar_australiano * this.dolar_australiano / bitcoin).toStringAsFixed(2);
  }

  void _yenchanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double yen = double.parse(text);
    realController.text = (yen * this.yen).toStringAsFixed(2);
    dolarController.text = (yen * this.yen / dolar).toStringAsFixed(2);
    euroController.text = (yen * this.yen / euro).toStringAsFixed(2);
    libraController.text = (yen * this.yen /libra).toStringAsFixed(2);
    pesoController.text = (yen * this.yen / peso).toStringAsFixed(2);
    cadController.text = (yen * this.yen / dolar_canadense).toStringAsFixed(2);
    yenController.text = (yen * this.yen / dolar_australiano).toStringAsFixed(2);
    cnyController.text = (yen * this.yen / renminbi).toStringAsFixed(2);
    btcController.text = (yen * this.yen / bitcoin).toStringAsFixed(2);
  }

  void _cnychanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double renminbi = double.parse(text);
    realController.text = (renminbi * this.renminbi).toStringAsFixed(2);
    dolarController.text = (renminbi * this.renminbi / dolar).toStringAsFixed(2);
    euroController.text = (renminbi * this.renminbi / euro).toStringAsFixed(2);
    libraController.text = (renminbi * this.renminbi /libra).toStringAsFixed(2);
    pesoController.text = (renminbi * this.renminbi / peso).toStringAsFixed(2);
    cadController.text = (renminbi * this.renminbi / dolar_canadense).toStringAsFixed(2);
    yenController.text = (renminbi * this.renminbi / dolar_australiano).toStringAsFixed(2);
    cnyController.text = (renminbi * this.renminbi / yen).toStringAsFixed(2);
    btcController.text = (renminbi * this.renminbi / bitcoin).toStringAsFixed(2);
  }

  void _btcchanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double bitcoin = double.parse(text);
    realController.text = (bitcoin * this.bitcoin).toStringAsFixed(2);
    dolarController.text = (bitcoin * this.bitcoin / dolar).toStringAsFixed(2);
    euroController.text = (bitcoin * this.bitcoin / euro).toStringAsFixed(2);
    libraController.text = (bitcoin * this.bitcoin /libra).toStringAsFixed(2);
    pesoController.text = (bitcoin * this.bitcoin / peso).toStringAsFixed(2);
    cadController.text = (bitcoin * this.bitcoin / dolar_canadense).toStringAsFixed(2);
    audController.text = (bitcoin * this.bitcoin / dolar_australiano).toStringAsFixed(2);
    yenController.text = (bitcoin * this.bitcoin / yen).toStringAsFixed(2);
    cnyController.text = (bitcoin * this.bitcoin / renminbi).toStringAsFixed(2);
  }

  late Future<Map> _dataFuture;
  @override
  void initState(){
    super.initState();
    _dataFuture = getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "\$ Cambio.Net \$",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.yellowAccent,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Map>(
        future: _dataFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ao carregar dados :(",
                    style: TextStyle(color: Colors.amber, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                dolar = snapshot.data ?["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data ?["results"]["currencies"]["EUR"]["buy"];
                libra = snapshot.data ?["results"]["currencies"]["GBP"]["buy"];
                peso = snapshot.data ?["results"]["currencies"]["ARS"]["buy"];
                dolar_canadense = snapshot.data ?["results"]["currencies"]["CAD"]["buy"];
                dolar_australiano = snapshot.data ?["results"]["currencies"]["AUD"]["buy"];
                yen = snapshot.data ?["results"]["currencies"]["JPY"]["buy"];
                renminbi = snapshot.data ?["results"]["currencies"]["CNY"]["buy"];
                bitcoin = snapshot.data ?["results"]["currencies"]["BTC"]["buy"];
                return SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10),
                        Icon(Icons.monetization_on_outlined, size: 140.0, color: Colors.amber,),
                        Divider(),
                        Row(
                          children: [
                            Text('buildtextfield("Reais", "R\$ 0.00", realController, _realchanged )',
                            ),
                            Divider(),
                        Icon(Icons.)

                          ],
                        )


                        buildtextfield("Dólares", "U\$ 0.00", dolarController, _dolarchanged ),
                        Divider(),
                        buildtextfield("Euros", "0.00 €", euroController, _eurochanged ),
                        Divider(),
                        buildtextfield("Libras", "0.00 £", libraController, _librachanged ),
                        Divider(),
                        buildtextfield("Pesos", "\$ 0.00", pesoController, _pesochanged ),
                        Divider(),
                        buildtextfield("Dólar Canadense", "\$CAD 0.00", cadController, _cadchanged ),
                        Divider(),
                        buildtextfield("Dólar Australiano", "A\$ 0.00", audController, _audchanged ),
                        Divider(),
                        buildtextfield("Yen", "¥ 0.00", yenController, _yenchanged ),
                        Divider(),
                        buildtextfield("Renminbi", "¥ 0.00", cnyController, _cnychanged ),
                        Divider(),
                        buildtextfield("Bitcoin", "₿ 0.00", btcController, _btcchanged ),


                      ],
                    ));
              }
          }
        },
      ),
    );
  }
}
Widget buildtextfield(String label, String hint, TextEditingController c, void Function(String) funcao){
  return TextField(
    controller: c,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(

      labelText: label,
      labelStyle: TextStyle(color: Colors.amber, fontSize: 30, fontWeight: FontWeight.w700),

      hintText: hint,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(

        borderSide: BorderSide(

          color: Colors.amber,
          width: 2,

        ),

      ),
      enabledBorder: OutlineInputBorder(

        borderSide: BorderSide(

          color: Colors.amber,
          width: 2,

        ),

      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,

    ),
    onChanged: funcao,
  );

}

Future<Map> getData() async{
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}
