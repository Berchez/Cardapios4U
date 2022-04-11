import 'package:cardapios4u/commons.dart';
import 'package:cardapios4u/models/produtos.dart';
import 'package:flutter/material.dart';
import 'package:cardapios4u/controller/produtos_controller.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

import 'package:intl/intl.dart';

var num = NumberFormat('###.00', 'en_US');

class ProdutosComandas extends StatelessWidget {
  final ProdutosController produtosController = Get.find();
  ProdutosComandas({ Key? key }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {

    return Obx( () =>
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.80,
          child: ListView.builder(
            itemCount: produtosController.produtos.length,
            itemBuilder: (BuildContext context, int index){
              return ProdutosComandasCard(
                produtosController: produtosController,
                produto: produtosController.produtos.keys.toList()[index],
                quantidade: produtosController.produtos.values.toList()[index],
                index: index,
              );
            }
          ),
        ),
      ),
    );
  }
}

class ProdutosComandasCard extends StatelessWidget {
  final ProdutosController produtosController;
  final Produtos produto;
  final int quantidade; 
  final int index;
  const ProdutosComandasCard({ Key? key, required this.produtosController, required this.produto, required this.quantidade, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        height: 100,
        width: 230,
        decoration: BoxDecoration(color: white, boxShadow: [
          BoxShadow(
            color: orange.shade100,
            offset: const Offset(5, 5),
            blurRadius: 10,
          ),
        ]),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('images/${produto.imagem}', height: 50, width: 50, fit: BoxFit.cover,)
            ),
            const SizedBox(width: 5,),
            Flexible(
              child:
              Row(children: [
                CustomText(text: ' ' + quantidade.toString() + 'x ', size: 14,),
                CustomText(
                  text: produto.nome,
                  size: 18,
                ),
              ],)  
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(20), boxShadow: [
                  BoxShadow(
                    color: grey.shade300,
                    offset: const Offset(1, 1),
                    blurRadius: 4,
                  ),
                ]),
                
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: 'R\$ ${num.format((produto.preco) * quantidade)}',
                weight: FontWeight.w600,
              ),
            ),

            Container(
              width: 33,
              height: 33,
              decoration: BoxDecoration(
                color: orange.shade500,
                border: Border.all(color: black, width: 1),
                borderRadius: BorderRadius.circular(50)
              ),
              child: IconButton(
                onPressed: () => produtosController.removeProduto(produto), 
                icon: const Icon(Icons.delete_outline, size: 15
              ))
            ),
            const SizedBox(width: 10,)
          ]
        )
      ),
    );
  }
}