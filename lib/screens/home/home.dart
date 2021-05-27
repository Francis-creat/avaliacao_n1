import 'package:flutter/material.dart';
import 'package:avaliacao_n1/models/produto.dart';
import 'package:avaliacao_n1/provider/produtos.dart';
import 'package:avaliacao_n1/style.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ofertas do dia",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Image.asset(
          'assets/images/logo.jpg',
        ),
        backgroundColor: bluetheme,
      ),
      body: Column(
        children:[
          Image.asset('assets/images/linha.jpg',),
          Expanded(
            child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 15),
        itemBuilder: builder,
        itemCount: listOfprodutos.length,
        
      ),
      
          )
        ]
      )
    );
  }

  Widget builder(BuildContext context, int index) {
    Produto produto = listOfprodutos.elementAt(index);
    return ListTile(
      leading: Image.asset(produto.photos),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            produto.name,
            style: TextStyle(
                fontSize: 13, color: (greytheme), fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 7),
          Text(
            produto.descrition,
            style: TextStyle(
              fontSize: 13,
              color: (greytheme),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          Row(children: [
            Text(
              "R\$",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              produto.price,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          Row(children: [
            Text(
              produto.plots,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "R\$",
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              produto.value,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          // ? - se for true (verdadeiro)
          // ? - se for false (falso)
          (produto.islove) ? Icons.favorite : Icons.favorite_border,
          color: purpletheme,
          size: 20,
        ),
        onPressed: () {
          // Reconstruir a tela
          setState(() {
            produto.islove = !produto.islove;
          });
        },
      ),
    );
  }
}
