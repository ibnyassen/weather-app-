class weatherModel {
  final String CityName;
  final String date;
  final double temp;
  final double MaxTemp;
  final double MinTemp;
  final String weatherCondition;
  final String image;

  weatherModel(
      {required this.CityName,
      required this.date,
      required this.temp,
      required this.MaxTemp,
      required this.MinTemp,
      required this.weatherCondition,
      required this.image});

  factory weatherModel.fromJson(json) {
    return weatherModel(
        CityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        MaxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        MinTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
