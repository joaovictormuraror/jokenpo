
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Jokenpo",
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    ),
  );
}

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel ou Tesoura"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 175),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top:10, bottom: 0),
              child: Text(
                "Oponente (Bot):",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Image.asset("assets/img/homem.png", height: 350),
            Padding(
              padding: EdgeInsets.only(top:50, bottom: 20),
              child: Text(
                "Escolha uma opção:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                GestureDetector(
                  onTap: () => _jogar(), // parando aqui 21:07MIN
                  child: Image.asset("assets/img/mao_fechada.png", height: 100),
                )
                
                Image.asset("assets/img/mao_aberta.png", height: 100),
                Image.asset("assets/img/tesoura.png", height: 100),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
