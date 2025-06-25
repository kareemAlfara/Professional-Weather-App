# 🌦️ Professional Weather App

A modern, visually rich weather application built with Flutter, offering accurate forecasts, elegant UI animations, and a powerful city-based search system.

![Banner](screenshots/banner.png)

---

## ✨ Key Features

- 🔍 **City-based weather search**
- 📈 **Graphical "Today Forecasting" view**
- 🌡️ Live temperature, wind, and humidity data
- 🌅 Smooth weather icon animations (sun, rain, cloud, etc.)
- 🌃 Full dark mode support
- 🚀 Beautiful loading transitions (e.g., animated paper plane)
- 🧭 Custom-designed cards for daily & hourly forecasts
- 💠 Weather data fetched via WeatherAPI (with location or city name)

---

## 📷 Screenshots

| Home View | Hourly Forecast | Today’s Graph |
|-----------|------------------|----------------|
| ![](screenshots/home.png) | ![](screenshots/hourly.png) | ![](screenshots/graph.png) |

---

## 🧰 Tech Stack

| Layer         | Library / Tool                    |
|---------------|-----------------------------------|
| UI            | `flutter`, `custom painter`, `flutter_svg` |
| State Mgmt    | `setState`, future builder (stateless logic) |
| Network       | `http` package                    |
| Data Layer    | JSON parsing from WeatherAPI      |
| Design Assets | Lottie, Animated Icons, Gradients |

---

## 🚀 Getting Started

### 🔑 Prerequisites
- Flutter SDK installed
- WeatherAPI key from [https://www.weatherapi.com](https://www.weatherapi.com)

### ⚙️ Installation

```bash
git clone https://github.com/kareemAlfara/Professional-Weather-App.git
cd new_weather_app
flutter pub get
