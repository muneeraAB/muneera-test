class Item {
  String _name;
  double _price;

  Item(this._name, this._price);

  String get name => _name;
  double get price => _price;

  String displayItem() {
    return '$_name - ${_price.toStringAsFixed(2)}';
  }
}

class ItemStock {
  Item _item;
  int _stock;

  ItemStock(this._item, this._stock);

  bool isInStock() {
    return _stock > 0;
  }

  void decreaseStock() {
    if (_stock > 0) {
      _stock--;
    }
  }

  String get itemName => _item.name;
  double get itemPrice => _item.price;
  int get stock => _stock;

  String displayItem() {
    return _item.displayItem(); // Use the displayItem method of Item
  }
}

class VendingMachine {
  List<ItemStock> _items = [];
  double _balance = 0.0;

  void addItem(ItemStock itemStock) {
    _items.add(itemStock);
  }

  void displayItems() {
    print('Items Available:');
    for (var i = 0; i < _items.length; i++) {
      var stock = _items[i];
      var stockStatus =
          stock.isInStock() ? 'Stock: ${stock.stock}' : 'Out of stock';
      print('${i + 1}. ${stock.displayItem()} (${stockStatus})');
    }
  }

  void insertMoney(double amount) {
    _balance += amount;
    print(
        'Inserted: ${amount.toStringAsFixed(2)}, Total Balance: ${_balance.toStringAsFixed(2)}');
  }

  void selectItem(String itemName) {
    var itemStock = _items.firstWhere(
      (item) => item.itemName == itemName,
      orElse: () => ItemStock(Item('Not Found', 0), 0),
    );

    if (itemStock.itemName == 'Not Found') {
      print('Item not found.');
    } else if (!itemStock.isInStock()) {
      print('$itemName is out of stock.');
    } else {
      print(
          'Selected: ${itemStock.itemName}, Price: ${itemStock.itemPrice.toStringAsFixed(2)}');
    }
  }

  void dispenseItem(String itemName) {
    var itemStock = _items.firstWhere(
      (item) => item.itemName == itemName,
      orElse: () => ItemStock(Item('Not Found', 0), 0),
    );

    if (itemStock.itemName == 'Not Found') {
      print('$itemName is not available.');
      return;
    }

    if (_balance < itemStock.itemPrice) {
      print('Insufficient balance for $itemName. Please insert more money.');
      return;
    }

    _balance -= itemStock.itemPrice;
    itemStock.decreaseStock();
    print('Dispensing: $itemName...');
    print('Remaining balance: ${_balance.toStringAsFixed(2)}');
  }

  double getChange() {
    double change = _balance;
    _balance = 0.0; // Reset balance
    return change;
  }
}
