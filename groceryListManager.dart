import 'dart:io';

void main() {
  // initialize an empty List
  List<String> groceryItems = [];

  bool programOn = true;
  // menu-driven interface
  while (programOn) {
    print('1.Add Item');
    print('2.Remove Item');
    print('3.View List');
    print('4.Search for Item');
    print('5.Exit');
    print('Enter your operation number');
    String opertionNumber = (stdin.readLineSync()!);

    // switch > for excuting each operation according to operation number
    switch (opertionNumber) {
      // case 1 > Add Item
      case '1':
        {
          print('Enter the item you want to add to grocery');
          String addItem = stdin.readLineSync()!;
          bool issuccessed = addItems(addItem, groceryItems);
          if (issuccessed) {
            print('success Add Item operation');
          } else {
            print('not success Add Item operation, the item is exist already');
          }
          break;
        }
      // case 2 > Remove Item
      case '2':
        {
          print('Enter the item you want to remove from grocery');
          String removedItem = stdin.readLineSync()!;
          bool issuccessed = removeItems(removedItem, groceryItems);
          if (issuccessed) {
            print('success remove Item operation');
          } else {
            print(
                'not success remove Item operation, the item isn\'t exist in grocery or grocery is empty now');
          }
          break;
        }
      // case 3 > View List
      case '3':
        {
          print('the list items: ');
          groceryItems.forEach(
            (element) {
              print(element);
            },
          );
          break;
        }
      // case 4 > Search for Item
      case '4':
        {
          print('Enter the item you want to search aout it in grocery');
          String searchItem = stdin.readLineSync()!;
          int returnValue = searchItems(searchItem, groceryItems);
          if (returnValue == -1) {
            print(
                'the item you search about it isn\'t exist in grocery or grocery is empty now');
          } else {
            print(
                'the item you search about it is exist in index $returnValue');
          }
          break;
        }
      // case 5 > Exit
      case '5':
        {
          programOn = false;
          break;
        }
      // case 6 > in case user doesn't any case above
      default:
        {
          print('please, Enter operation number from numbers down');
        }
    }
  }
}

// Add Items fuction
bool addItems(String addItem, List<String> groceryItems) {
  bool notEXist = true;
  for (int i = 0; i < groceryItems.length; i++) {
    if (groceryItems[i].toUpperCase() == addItem.toUpperCase()) {
      notEXist = false;
    }
  }

  if (notEXist) {
    groceryItems.add(addItem);
  }
  bool issuccessed = notEXist;
  return issuccessed;
}

// Remove Items function
bool removeItems(String removeItem, List<String> groceryItems) {
  bool isexisted = false;
  for (int i = 0; i < groceryItems.length; i++) {
    if (groceryItems[i].toUpperCase() == removeItem.toUpperCase()) {
      groceryItems.remove(groceryItems[i]);
      isexisted = true;
      break;
    }
  }
  bool issuccessed = isexisted;
  return issuccessed;
}

// Search for Items function
int searchItems(String searchitem, List<String> groceryItems) {
  int index;
  for (int i = 0; i < groceryItems.length; i++) {
    if (searchitem.toUpperCase() == groceryItems[i].toUpperCase()) {
      index = i;
      return index;
    }
  }
  return -1;
}
