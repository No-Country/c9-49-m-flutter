void main() {
  //List
  var myList = [1, 2, 3];
  print(myList); //Toda la lista
  print(myList[0]); //Un elemento

  //Change a item
  myList[0] = 31;
  print(myList); // --> [31,2,3]

  //Empty list
  var emptyList = []; //--> []

  //Add item
  emptyList.add(40); //--> [40]

  //Add multiple items
  emptyList.addAll([1, 2, 3]); //--> [40,1,2,3]

  //Insert at specific position
  myList.insert(3, 999); // --> [31,2,3,999]
//  myList.insert(4, 999); // --> Range error

  //Insert many
  myList.insertAll(1, [99, 95, 91]); //--> [31, 99, 95, 91, 2, 3, 999]
  print(myList);

  //Mixed lists
  var mixedList = [1, 2, 3, 4, "john", "raul"];

  //Remove list
  mixedList.remove(
      "john"); // --> Remove all items with value "john" = [1, 2, 3, 4, raul]

  //Remove from specific location
  mixedList.removeAt(4); //--> [1, 2, 3, 4]
}
