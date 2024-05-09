import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cuibts/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search a City",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onFieldSubmitted: (value) {
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(CityName: value);
                  Navigator.pop(context);
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  hintText: "enter city name",
                  labelText: 'search',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
