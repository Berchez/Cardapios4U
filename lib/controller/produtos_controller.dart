import 'package:get/get.dart';
import 'package:cardapios4u/models/produtos.dart';

class ProdutosController extends GetxController{
  final _produtos = {}.obs;

  void addProduto(Produtos produto, int quantidade){
    
    if (_produtos.containsKey(produto)){
     _produtos[produto] += quantidade;  
    }
    else {
      _produtos[produto] = quantidade;
    }
  }

  get produtos => _produtos;

  void removeProduto(Produtos produto) {
    if (_produtos.containsKey(produto) && _produtos[produto] == 1){
      _produtos.removeWhere((key, value) => key == produto);
    }
    else {
      _produtos[produto] -= 1;
    }
  }

  get getTotalPagar =>   _produtos.isNotEmpty ? _produtos.entries.map((produto) => produto.key.preco * produto.value).toList().
    reduce((value, element) => value + element).toStringAsFixed(2) : '0.00';

  void limpaComanda(){
    _produtos.clear();
  }

}