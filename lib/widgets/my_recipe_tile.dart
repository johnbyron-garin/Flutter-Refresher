import 'package:flutter/material.dart';
import '../models/recipe.dart';

class MyRecipeTile extends StatelessWidget {
  final Recipe recipe;
  final void Function()? onTap;

  const MyRecipeTile({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recipe.name),
                      Text(
                        'Price: P${recipe.price}',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recipe.description,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(recipe.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
