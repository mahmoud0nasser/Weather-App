import 'package:flutter/material.dart';
import 'package:weather_app_th/views/search_view.dart';

import '../widgets/no_weather_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchView(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: NoWeatherBody());
  }
}

// 1. Create State
// 2. Create Cubit
// 3. Create Function
// 4. Provide Cubit
// 5. Integrate Cubit
// 6. trigger Cubit