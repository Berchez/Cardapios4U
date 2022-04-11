import 'package:cardapios4u/screens/produto_detalhes.dart';
import 'package:cardapios4u/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:cardapios4u/commons.dart';

import '../commons.dart';
import 'produtos.dart';
import 'package:intl/intl.dart';

var num = NumberFormat('###.00', 'en_US');

List<Produtos> produtosList = [
  Produtos('Cereais', 'hmm, cerial gostoso', '1.jpg', 4.2, 14.90),
  Produtos('Tacos', 'Entry tem que ta na entrada ne ?', '2.jpg', 4.8, 34.90),
  Produtos('Barca Açaí','barca do D\'Gusta', 'acai.jpeg', 4.98, 106.05),
  Produtos('Tacos Italianos', 'marchelloo mamamia', '4.jpeg', 2.8, 64.90),
];

class Entradas extends StatelessWidget {
  const Entradas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: produtosList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap:() {Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProdutoDetalhes(produto: (produtosList[index]))));},
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
                  child: 

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/${produtosList[index].imagem}', height: 60, width: 100),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: produtosList[index].nome,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5),
                                  child: Text(
                                    produtosList[index].descricao,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300, 
                                    ),  
                                  ) 
                                ),
                              ],
                            ),
                          ),
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
                            text: 'R\$ ${num.format(produtosList[index].preco)}',
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    /**Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: produtosList[index].nota.toString(),
                                    colors: grey,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Stack(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: red,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: red,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: red,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: red,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: grey,
                                        size: 18,
                                      ),
                                      Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: 'R\$ ${num.format(produtosList[index].preco)}',
                            weight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                    **/

                ),
              ),
            );
          }),
    );
  }
}
