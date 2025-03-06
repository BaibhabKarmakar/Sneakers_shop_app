import 'package:e_commerce_app/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  // List of shoes for sale :
  List<Shoe> shoeShop = [
    Shoe(
      description: "The forward-thinking design of his latest signature shoe",
      imagePath: "lib/images/zoomFreak.png",
      name: "Zoom Freak",
      price: "236",
    ),
    Shoe(
      description:
          "You\'ve got the hops and the speed-lace up in shoes that enhance what you bring to the court",
      imagePath: "lib/images/jordan.png",
      name: "Air Jordan",
      price: "240",
    ),
    Shoe(
      description: "A secure midfoot strap is suited for scoring binges and defensive stands—built to keep you locked in from tip-off to buzzer. ",
      imagePath: "lib/images/KDTREY.png",
      name: "KDTREY",
      price: "156",
    ),
    Shoe(
      description: "Bouncy cushioning is paired with soft yet supportive foam for unstoppable speed and smooth landings, keeping you fresh from the first quarter to clutch time.",
      imagePath: "lib/images/kyrie.png",
      name: "Kyrie 6",
      price: "250",
    ),
  ];
  // List of items in user cart :
  List<Shoe> userCart = [];
  // get list of shoes for sale :
  List<Shoe> getShoeList() {
    return shoeShop;
  }
  //get Cart :
  List<Shoe> getUserCart() {
    return userCart;
  }
  // add items in the Cart :
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }
  // remove items from cart :
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
