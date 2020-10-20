import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_v1_tutorial/data/model/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class WeatherLoaded extends WeatherState {
  final Weather weather;
  WeatherLoaded(this.weather);

  @override
  // TODO: implement props
  List<Object> get props => [weather];

}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];

}