import '../models/food.dart';

final List<Food> _foodItems = [
  // Sweet Filipino Food
  Food(
    name: "Leche Flan",
    description:
        "A rich and creamy custard dessert topped with a golden caramel glaze. Made from egg yolks, condensed milk, and a hint of vanilla, it melts in your mouth with every bite.",
    price: 150,
    image: "lib/images/sweet/leche_flan.jpg",
    type: FoodCategory.Sweet,
    availableAddons: [
      Addon(name: "Extra Caramel", price: 20),
      Addon(name: "Whipped Cream", price: 10),
    ],
  ),
  Food(
    name: "Halo-Halo",
    description:
        "A refreshing Filipino dessert made with shaved ice, sweetened beans, fruits, jelly, and leche flan, all topped with ube ice cream and evaporated milk. Perfect for hot days!",
    price: 120,
    image: "lib/images/sweet/halo_halo.jpg",
    type: FoodCategory.Sweet,
    availableAddons: [
      Addon(name: "Extra Ube Ice Cream", price: 30),
      Addon(name: "Leche Flan", price: 40),
    ],
  ),
  Food(
    name: "Bibingka",
    description:
        "A traditional rice cake baked with coconut milk and topped with salted egg, cheese, and grated coconut. It’s a favorite treat during the holiday season.",
    price: 100,
    image: "lib/images/sweet/bibingka.jpg",
    type: FoodCategory.Sweet,
    availableAddons: [
      Addon(name: "Extra Cheese", price: 20),
      Addon(name: "Salted Egg", price: 30),
    ],
  ),
  Food(
    name: "Turon",
    description:
        "Sweet banana slices and jackfruit wrapped in spring roll pastry and fried to golden perfection with a caramelized sugar coating. A crunchy and sweet Filipino snack.",
    price: 50,
    image: "lib/images/sweet/turon.jpg",
    type: FoodCategory.Sweet,
    availableAddons: [
      Addon(name: "Vanilla Ice Cream", price: 20),
      Addon(name: "Chocolate Syrup", price: 10),
    ],
  ),
  Food(
    name: "Ube Halaya",
    description:
        "A vibrant purple yam jam made from boiled and mashed ube, sweetened milk, and butter. Its creamy texture and unique flavor make it a beloved dessert.",
    price: 200,
    image: "lib/images/sweet/ube_halaya.jpg",
    type: FoodCategory.Sweet,
    availableAddons: [
      Addon(name: "Coconut Flakes", price: 20),
      Addon(name: "Crushed Nuts", price: 30),
    ],
  ),
  // Savory Filipino Food
  Food(
    name: "Adobo",
    description:
        "A classic Filipino dish of chicken or pork marinated in soy sauce, vinegar, garlic, and spices, then simmered to perfection. Served with steamed rice for a hearty meal.",
    price: 250,
    image: "lib/images/savory/adobo.jpg",
    type: FoodCategory.Savory,
    availableAddons: [
      Addon(name: "Extra Rice", price: 20),
      Addon(name: "Boiled Egg", price: 10),
    ],
  ),
  Food(
    name: "Sinigang",
    description:
        "A tangy and savory tamarind-based soup loaded with vegetables and your choice of pork, shrimp, or fish. This comforting dish is best enjoyed with rice.",
    price: 220,
    image: "lib/images/savory/sinigang.jpg",
    type: FoodCategory.Savory,
    availableAddons: [
      Addon(name: "Extra Soup", price: 30),
      Addon(name: "Fish Sauce", price: 10),
    ],
  ),
  Food(
    name: "Pancit Canton",
    description:
        "A flavorful stir-fried noodle dish made with wheat noodles, vegetables, pork, chicken, or shrimp, and seasoned with soy sauce and citrus. A staple at Filipino celebrations.",
    price: 180,
    image: "lib/images/savory/pancit_canton.jpg",
    type: FoodCategory.Savory,
    availableAddons: [
      Addon(name: "Extra Vegetables", price: 20),
      Addon(name: "Chili Flakes", price: 10),
    ],
  ),
  Food(
    name: "Kare-Kare",
    description:
        "A traditional peanut stew with oxtail, tripe, and vegetables, served with bagoong (shrimp paste) on the side. Its rich, nutty flavor is a true Filipino favorite.",
    price: 280,
    image: "lib/images/savory/kare_kare.jpg",
    type: FoodCategory.Savory,
    availableAddons: [
      Addon(name: "Extra Bagoong", price: 20),
      Addon(name: "Steamed Rice", price: 10),
    ],
  ),
  Food(
    name: "Lumpiang Shanghai",
    description:
        "Crispy fried spring rolls filled with seasoned ground pork, carrots, and onions. Served with sweet chili sauce for dipping, it’s a popular appetizer or snack.",
    price: 150,
    image: "lib/images/savory/lumpiang_shanghai.jpg",
    type: FoodCategory.Savory,
    availableAddons: [
      Addon(name: "Extra Sweet Chili Sauce", price: 20),
      Addon(name: "Lettuce Leaves", price: 10),
    ],
  ),
];

List<Food> get foodItems => _foodItems;
