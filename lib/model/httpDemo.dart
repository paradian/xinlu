import 'package:flutter/material.dart';
import 'package:app/common/provider_model.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class RequestPage extends StatelessWidget {
  RequestPage({this.arguments});
  final Map arguments;
  File _image;
  Widget build(BuildContext context) {
    final cartList = Provider.of<cartListModel>(context);
    print("enter???${cartList.value[0].name}");
    print(cartList.value.toString());
    print(arguments);
    getTotal(List list) {
      double total = 0;
      list.length != 0
          ? list.forEach((item) => {total = total + item.price * item.count})
          : (total = 0);
      return total;
    }

    shareEvent() {
      final RenderBox box = context.findRenderObject();
      Share.share('follow me',subject:'www.baidu.com',sharePositionOrigin:box.localToGlobal(Offset.zero) &
                                          box.size );
    }
    setImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        _image = image;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('FormPage'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            cartList.value.length != 0
                ? ListView.builder(
                    itemBuilder: cart,
                    itemCount: cartList.value.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  )
                : Text('opps!data is gone'),
                _image != null?Image.file(_image):Text('no photo')
          ],
        ),
        height: 800,
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Text('总价：${getTotal(cartList.value)}'),
          FlatButton(
            child: Text('去结算'),
            onPressed: () => {print('结算'), setImage()},
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget cart(BuildContext context, int index) {
    return Container(
      child: Column(
        children: <Widget>[
          // Checkbox(value: null, onChanged: null),
          FlatButton(
            onPressed: () => {print(cartList.value[index].name)},
            child: Text('${cartList.value[index].name}'),
            color: Colors.green,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                {cartList.changeItem(index, cartList.value[index].count + 1)},
          ),
          FlatButton(
            onPressed: () => {},
            child: Text('${cartList.value[index].count}'),
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () =>
                {cartList.changeItem(index, cartList.value[index].count - 1)},
          ),

          FlatButton(
            onPressed: () => {},
            child: Text(
              '单价：${cartList.value[index].price}',
            ),
          ),
          IconButton(
            onPressed: () => {cartList.removeItem(index)},
            icon: Icon(Icons.delete),
            color: Colors.deepOrange,
          )

          //  Icon(Icons.remove),Text('${cartList.value[index].count}'),Icon(Icons.add),
          //  Text('单价：${cartList.value[index].price}',),
        ],
      ),
      height: 300,
      width: 300,
    );
  }
}
