import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/garador_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var quantidadeClicks = 0;
  var numeroGerado = 0;

  //tela
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meu app",
          //style: GoogleFonts.damion(),
        ), //"Meu primeiro App  ------ 04/10/2023"
      ),
      body: Container(
        color: Color.fromARGB(255, 130, 173, 127),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, //main no column é vertical
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.amberAccent,
              child: Text(
                "Demonstração de Column a baixo ",
                style: GoogleFonts.b612(fontSize: 16),
              ),
            ),
            SizedBox(
              width: 220,
              height: 100,
              child: Container(
                color: Colors.greenAccent,
                child: Text(
                  "Você apertou o botão $quantidadeClicks vezes",
                  style: GoogleFonts.b612(fontSize: 15),
                ),
              ),
            ),
            Container(
              color: Colors.cyan,
              child: Text(
                'Número aleatório  1188 é: $numeroGerado',
                style: GoogleFonts.b612(fontSize: 20),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        //Cada container desse é um item, com texto e cor
                        color: Colors.red,
                        child: Text(
                          'row',
                          style: GoogleFonts.b612(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //Cada container desse é um item, com texto e cor
                        color: Colors.green,
                        child: Text(
                          'row',
                          style: GoogleFonts.b612(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //Cada container desse é um item, com texto e cor
                        color: Colors.blue,
                        child: Text(
                          'row',
                          style: GoogleFonts.b612(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ), //Corpo
      floatingActionButton: FloatingActionButton(
        //botao
        child: const Icon(Icons.add),
        tooltip: 'Mais um clique',
        onPressed: () {
          setState(() {
            //Carregar a aplicação
            quantidadeClicks = quantidadeClicks + 1;
            numeroGerado = GeradorNumeroAleatorios.gerarNumeroAleatorio(100);
          });
        }, //No onPressed posso chamar a função direto ou colocar dentro de uma variavel que vai está dentros da chaves
      ),
    );
    //Container(); É um componente que pode colocar qualquer Widget, tem propriedades cor, tamanho entre outros
  }
}
