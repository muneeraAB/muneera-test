import 'item.dart';

void main() {
  print('Welcome to the Vending Machine!\n');

  var item1 = Item('Soda', 2.50);
  var item2 = Item('Chips', 1.50);
  var item3 = Item('Candy', 1.00);
  var stock1 = ItemStock(item1, 10);
  var stock2 = ItemStock(item2, 5);
  var stock3 = ItemStock(item3, 0);

  var vendingMachine = VendingMachine();
  vendingMachine.addItem(stock1);
  vendingMachine.addItem(stock2);
  vendingMachine.addItem(stock3);

  vendingMachine.displayItems();

  print('\nInsert money: 3.00');
  vendingMachine.insertMoney(3.00);

  print('\nSelect item: Soda');
  vendingMachine.selectItem('Soda');
  vendingMachine.dispenseItem('Soda');

  print('\nDo you want another item? (yes/no): no');

  var change = vendingMachine.getChange();
  print('Returning change: ${change.toStringAsFixed(2)}');
  print('Thank you for using the vending machine!');
}
