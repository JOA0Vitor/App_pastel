import 'package:flutter/material.dart';
import 'adicionarItem.dart';
import 'package:searchfield/searchfield.dart';
//https://www.youtube.com/watch?v=XNU3hX3QFeE ordenar list

class Pesquisar extends StatefulWidget {
  const Pesquisar({Key? key}) : super(key: key);

  @override
  _PesquisarState createState() => _PesquisarState();
}

class _PesquisarState extends State<Pesquisar> {
  // String searchValue = '';
  // final List<String> _suggestions = [
  //   'Afghanistan',
  //   'Albania',
  //   'Algeria',
  //   'Australia',
  //   'Brazil',
  //   'Germany',
  //   'Madagascar',
  //   'Mozambique',
  //   'Portugal',
  //   'Zambia',
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisar'),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
          child: Column(
            children: [
              SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                // ignore: unused_label
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 20)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (e) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search_off),
                );
              }, suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                return List<ListTile>.generate(4, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    leading: const Icon(Icons.pages),
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        controller.closeView(item);
                      });
                    },
                  );
                });
                // ignore: dead_code
              }),
              Expanded(
                // padding: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  shrinkWrap: true, // Defina shrinkWrap como true
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: FlutterLogo(size: 72.0),
                        title: Text('nome do produto'),
                        subtitle: Text("colocar aqui a data"),
                      ),
                    ),
                    Card(
                      child: Container(
                        height: 50,
                        color: Colors.amber[500],
                        child: const Center(child: Text('Entry B')),
                      ),
                    ),
                    ListTile(
                      title: Text("nome do prudto"),
                      subtitle: Text("22 Unidades"),
                      enabled: true,
                      trailing: Icon(Icons.abc),
                    ),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),

                      // trailing: Container(
                      //   height: 50,
                      //   color: Colors.amber[500],
                      //   child: const Center(child: Text('Entry B')),
                      // ),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                    Card(
                        child: ListTile(
                      title: Text('nome do produto'),
                      subtitle: Text("colocar aqui a data"),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // ignore: dead_code
  }
}
/* lixo e editar

  child: Row (
    children: [
      IconButton(icon: Icon(Icons.edit),onPressed: null),
      IconButton(icon: Icon(Icons.delete),onPressed: null),
    ]
  )

 */

/* 
  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pesquisar'),
          backgroundColor: const Color.fromARGB(255, 2, 133, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            // ignore: unused_label

            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20)),
              onTap: () {
                controller.openView();
              },
              onChanged: (e) {
                controller.openView();
              },
              leading: const Icon(Icons.search_off),
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(4, (int index) {
              final String item = 'item $index';
              return ListTile(
                leading: const Icon(Icons.pages),
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          }),
        ),
      ),
    );

 */