// ignore_for_file: prefer_const_constructors

import 'package:cardapios4u/screens/home_apos_comanda.dart';
import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:cardapios4u/commons.dart';
import 'package:cardapios4u/models/produtos.dart';
import 'package:cardapios4u/controller/produtos_controller.dart';
import 'package:get/get.dart';

class AddComanda extends StatefulWidget {
  final Produtos produto;
  const AddComanda({ Key? key, required this.produto}) : super(key: key);

  @override
  _AddComandaState createState() => _AddComandaState();
}

class _AddComandaState extends State<AddComanda> {
  int _quantidade = 1;
  final produtosController = Get.put(ProdutosController()); 
  int get quantidade {return _quantidade;}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (_quantidade > 0) {
                  setState(() {
                    _quantidade--;
                  });
                }
              },
              child:
                  
                Container(
                  width: 18,
                  height: 40,
                  color: const Color.fromARGB(255, 32, 33, 36),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('images/menosBranco.png', width: 20,),
                  ),
                ),
            ),

            Container(
              alignment: Alignment.center,
              width: 45,
              height: 40,
              color: orange,
              child: CustomText(text: _quantidade.toString(), size: 22, colors: white,),
            ),
            

            GestureDetector(
              onTap: () => setState(() {
                _quantidade++;
              }),
              child:
                  
                Container(
                  width: 18,
                  height: 40,
                  color: const Color.fromARGB(255, 32, 33, 36),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('images/mais_branco.png', width: 20,),
                  ),
                ),
            )
          ],
        ),

        GestureDetector(
          onTap: () {
            if (quantidade > 0) {
              produtosController.addProduto(widget.produto, quantidade);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeAposComanda()
                ), 
                (route) => false,
              );
            }else{
              AlertDialog alert = AlertDialog(
                title: const CustomText(text: 'Cê mó burrao hein...', weight: FontWeight.bold,),
                content: const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: CustomText(text: 'Vai querer adicionar 0 unidades à comanda mesmo ?', overflow: TextOverflow.visible,),
                ),
              );
              showDialog(context: context, builder: (BuildContext context) {
                return alert;
              });
            }
          },
          child: Container(
            width: 200,
            height: 40,
            color: orange,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomText(text: 'Adicionar à comanda', align: TextAlign.center, colors: white,),
            ),
          ),
        )
        ],
      )
    );    
  }
}