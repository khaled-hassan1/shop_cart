class ShoppingCartItem {
  final String name;
  final double price;
  final int quantity;

  ShoppingCartItem(this.name, this.price, this.quantity);
}

class ShoppingCart {
  List<ShoppingCartItem> _items = [];
  double _totalPrice = 0.0;

  List<ShoppingCartItem> get items => [..._items];
  double get totalPrice => _totalPrice;
  int get itemCount => _items.length;

  void addItem(ShoppingCartItem item) {
    _items.add(ShoppingCartItem(item.name, item.price, item.quantity));
  }

  void removeItem(String name) {
    _items.removeWhere((element) => element.name == name);
  }

  double clculateTotalPrice() {
    _items.forEach((element) {
      _totalPrice += element.price * element.quantity;
    });
    return totalPrice;
  }
}

void main(List<String> args) {
  ShoppingCart shoppingCart = ShoppingCart();
  ShoppingCartItem item1 = ShoppingCartItem('name1', 10, 1);
  ShoppingCartItem item2 = ShoppingCartItem('name2', 20, 2);

  shoppingCart.addItem(item1);
  shoppingCart.addItem(item2);

  double totalPrice = shoppingCart.clculateTotalPrice();

  for (var element in shoppingCart._items) {
    print(
        'Name: ${element.name} || Price: \$${element.price} || Quantity: ${element.quantity}');
  }
  print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
}
