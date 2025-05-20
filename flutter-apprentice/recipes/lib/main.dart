import 'package:flutter/material.dart';

import 'recipe.dart';
import 'recipe_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Recipes',
      theme: theme.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Recipes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      // 2
      appBar: AppBar(title: Text(widget.title)),
      // 3
      body: SafeArea(
        // 4
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            // 5
            itemCount: Recipe.samples.length,
            // 6
            itemBuilder: (BuildContext context, int index) {
              // 7
              return GestureDetector(
                // 8
                onTap: () {
                  // 9
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        // 10
                        return RecipeDetail(recipe: Recipe.samples[index]);
                      },
                    ),
                  );
                },
                // 11
                child: buildRecipeCard(Recipe.samples[index]),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget buildRecipeCard(Recipe recipe) {
  //   return Card(
  //     child: buildRecipeCardColumn(recipe)
  //   );
  // }
  //
  // Column buildRecipeCardColumn(Recipe recipe) {
  //   return Column(
  //     children: <Widget>[
  //       Image(image: AssetImage(recipe.imageUrl)),
  //       Text(recipe.label),
  //     ],
  //   );
  // }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0,
      // 2
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(image: AssetImage(recipe.imageUrl)),
            ),
            // Image(image: AssetImage(recipe.imageUrl)),
            // 5
            const SizedBox(height: 14.0),
            // 6
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
