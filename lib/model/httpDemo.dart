import 'package:flutter/material.dart';
import 'package:app/common/provider_model.dart';
import 'package:provider/provider.dart';
class RequestPage extends StatelessWidget{
  RequestPage({this.arguments});
 final Map arguments;

  Widget build(BuildContext context){
    final cartList = Provider.of<cartListModel>(context);
    print("enter???${cartList.value[0].name}");
    print(cartList.value.toString());
    print(arguments);
    return Scaffold(
      appBar: AppBar(title:Text('FormPage'),backgroundColor: Colors.lightGreen,),
      body: Container (
        child:Column(children: <Widget>[
         cartList.value.length !=0 ? ListView.builder(itemBuilder: cart,itemCount: cartList.value.length,scrollDirection: Axis.vertical,shrinkWrap: true,):Text('opps!data is gone')
        ],),
        


      ),
      backgroundColor: Colors.white,
    );


  }
  Widget cart (BuildContext context,int index) {
    return Container(
      child: Column(children: <Widget>[
        // Checkbox(value: null, onChanged: null),
        Text('${cartList.value[index].name}'),
         Icon(Icons.delete),Text('${cartList.value[index].count}'),Icon(Icons.add),
         Text('单价：${cartList.value[index].price}'),
      ],),
      height: 200,
      width: 200,
    );
  }
}