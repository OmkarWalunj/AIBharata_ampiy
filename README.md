# aiassignment

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
Ampiy Data Feed
Overview
This Flutter app connects to Ampiy’s WebSocket API to display real-time coin data. The app shows a list of coins with their current prices and percent changes.

Features
Real-time updates of coin prices and percent changes
Displays images for each coin
Shows current price and percent change with two decimal precision
Prerequisites
Flutter SDK (version 3.0.0 or higher)
Dart SDK (version 2.17.0 or higher)
Getting Started
Follow these steps to replicate and run the project:

1. Clone the Repository
sh
Copy code
git clone https://github.com/OmkarWalunj/ampiy_data_feed.git
cd ampiy_data_feed
2. Install Dependencies
Ensure you have Flutter and Dart installed. Navigate to the project directory and run:

sh
Copy code
flutter pub get
3. Run the Application
To run the app, use the following command:

sh
Copy code
flutter run
This will start the app on your connected device or emulator.

Code Explanation
WebSocket Connection
The app connects to the WebSocket API at ws://prereg.ex.api.ampiy.com/prices and subscribes to the ticker data for all coins. It handles incoming messages and updates the coin data list.

Data Handling
WebSocket Setup: Connects to the WebSocket and sends a subscription message.
Data Processing: Listens for messages and updates the list of coins.
Logging: Logs the updated coin data list for debugging purposes.
UI Components
ListView: Displays the list of coins.
ListTile: Shows each coin’s image, symbol, current price, and percent change.
Image Handling: Uses placeholder images for demonstration or fetches real coin images.
Code Structure
lib/main.dart: Entry point of the application.
lib/ampiy_data_feed.dart: Contains the main widget and WebSocket connection logic.
API Details
WebSocket URL: ws://prereg.ex.api.ampiy.com/prices

Subscription Message:

json
Copy code
{
  "method": "SUBSCRIBE",
  "params": [
    "all@ticker"
  ],
  "cid": 1
}
Data Format:

json
Copy code
{
  "stream": "all@fpTckr",
  "data": [
    {
      "T": "fpTckr",
      "s": "BTCINR",
      "p": "-1351.78000000",
      "P": "-2.740",
      "c": "3615589.2020",
      "o": "3717432.3072",
      "h": "3744326.4270",
      "l": "3595768.0014",
      "b": "3615139.4222",
      "a": "3615372.2228"
    }
  ]
}
Contributing
Feel free to fork the repository and submit pull requests. For any issues or feature requests, please open an issue on GitHub.
