import 'package:flutter/material.dart';

import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/api/mock_fooderlich_service.dart';
import 'package:fooderlich/components/components.dart';

class RecipesScreen extends StatelessWidget {
  // 1
  final exploreService = MockFooderlichService();

  RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 2
    return FutureBuilder(
      // 3
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        // 4
        if (snapshot.connectionState == ConnectionState.done) {
          // Add RecipesGridView Here
          // 5
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          // 6
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
