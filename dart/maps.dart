void main() {
  //Maps
  var toppings = {"John": "Fuggazeta", "Mary": "Chesse"};
  toppings; //--> {John: Fuggazeta, Mary: Chesse}
  toppings["Mary"]; //--> Chesse

  //Show all values
  print(toppings.values); // --> (Fuggazeta, Chesse)

  //Show all keys
  print(toppings.keys); // --> (John, Mary)

  //Show Length
  print(toppings.length); // --> 2

  //Add something
  toppings["Raul"] =
      "Muzza"; //--> {John: Fuggazeta, Mary: Chesse, Raul: Muzza }

  //Add many things
  toppings.addAll({"Pepe": "Bacon", "Steve": "Supreme"});
  toppings; // --> {John: Fuggazeta, Mary: Chesse, Raul: Muzza, Pepe: Bacon, Steve: Supreme}

  //Remove something
  toppings.remove("Steve");
  toppings; // --> {John: Fuggazeta, Mary: Chesse, Raul: Muzza, Pepe: Bacon}

  //Remove all
  toppings.clear();
  toppings; // --> {}
}
