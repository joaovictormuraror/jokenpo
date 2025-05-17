import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Pedra, Papel ou Tesoura",
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
  List opcoes = ["pedra", "papel", "tesoura"];
  String _mensagem = "Escolha uma opção:";
  String _bot = "assets/img/homem.png";
  String? _jogadaUsuario;
  bool _jogadaFeita = false;

  void realizarJogo() {
    if (_jogadaUsuario == null) return;

    int i = Random().nextInt(3);
    String escolherAleatorio = opcoes[i];
    setState(() {
      _bot = "assets/img/" + escolherAleatorio + ".png";

      if (_jogadaUsuario == "pedra" && escolherAleatorio == "tesoura") {
        _mensagem = "Você ganhou do bot";
      } 
      else if (_jogadaUsuario == "papel" && escolherAleatorio == "pedra") {
        _mensagem = "Você ganhou do bot";
      } 
      else if (_jogadaUsuario == "tesoura" && escolherAleatorio == "papel") {
        _mensagem = "Você ganhou do bot";
      } 
      else if (_jogadaUsuario == "pedra" && escolherAleatorio == "papel") {
        _mensagem = "Você perdeu pro bot kkkkkkkk";
      } 
      else if (_jogadaUsuario == "papel" && escolherAleatorio == "tesoura") {
        _mensagem = "Você perdeu pro bot kkkkkkkk";
      } 
      else if (_jogadaUsuario == "tesoura" && escolherAleatorio == "pedra") {
        _mensagem = "Você perdeu pro bot kkkkkkkk";
      } 
      else {
        _mensagem = "Deu empate 👀";
      }

      _jogadaFeita = true;
    });
  }

  void resetarJogo() {
    setState(() {
      _jogadaUsuario = null;
      _mensagem = "Escolha uma opção:";
      _bot = "assets/img/homem.png";
      _jogadaFeita = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel ou Tesoura"),
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Text(
                "Oponente (Bot):",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset(_bot, height: 350),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Text(
                _mensagem,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogadaUsuario = "pedra";
                    });
                  },
                  child: Image.asset("assets/img/mao_fechada.png", height: 100),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogadaUsuario = "papel";
                    });
                  },
                  child: Image.asset("assets/img/mao_aberta.png", height: 100),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _jogadaUsuario = "tesoura";
                    });
                  },
                  child: Image.asset("assets/img/mao_tesoura.png", height: 100),
                ),
              ],
            ),
            Visibility(
              visible: _jogadaUsuario != null && !_jogadaFeita,
              child: ElevatedButton(
                onPressed: realizarJogo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
                child: Text("Jogar"),
              ),
            ),
            Visibility(
              visible: _jogadaFeita,
              child: ElevatedButton(
                onPressed: resetarJogo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                child: Text("Jogar Novamente"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
