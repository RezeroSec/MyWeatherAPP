class ConvertToWeatherIcons {
  String conv(String iconID) {
    // Day Icon
    if (iconID == "01d") {
      return "wi-day-sunny";
    }
    if (iconID == "02d") {
      return "wi-day-cloudy";
    }
    if (iconID == "03d") {
      return "wi-cloud";
    }
    if (iconID == "04d") {
      return "wi-cloudy";
    }
    if (iconID == "09d") {
      return "wi-rain";
    }
    if (iconID == "10d") {
      return "wi-day-rain-mix";
    }
    if (iconID == "11d") {
      return "wi-thunderstorm";
    }
    if (iconID == "13d") {
      return "wi-day-snow";
    }
    if (iconID == "50d") {
      return "wi-windy";
    }

    // night Icon
    if (iconID == "01n") {
      return "wi-night-clear";
    }
    if (iconID == "02n") {
      return "wi-night-alt-cloudy";
    }
    if (iconID == "03n") {
      return "wi-cloud";
    }
    if (iconID == "04n") {
      return "wi-cloudy";
    }
    if (iconID == "09n") {
      return "wi-rain";
    }
    if (iconID == "10n") {
      return "wi-night-alt-rain-mix";
    }
    if (iconID == "11n") {
      return "wi-thunderstorm";
    }
    if (iconID == "13n") {
      return "wi-night-alt-snow";
    }
    if (iconID == "50d") {
      return "wi-windy";
    }

    return "none";
  }
}
