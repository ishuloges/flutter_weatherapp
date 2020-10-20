import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_v1_tutorial/data/weather_repository.dart';

import 'bloc.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;
  
  WeatherBloc(this.repository);

  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
    //Emitting a state from the asynchronous generator
    yield WeatherLoading();
    //Branching the executed logic by checking the event type
    if(event is GetWeather){
      //emit either loaded error
      try {
        final weather = await repository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkError{
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    } else if(event is GetDetailWeather){
      try{
        final weather = await repository.fetchDetailedWeather(event.cityName);
        yield WeatherLoaded(weather);
      }on NetworkError{
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
  
  
}
