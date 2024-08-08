# flutter_test_app

A new Flutter project.

# Flutter WebSocket Project

This Flutter project demonstrates how to use WebSocket communication to send and receive data. The app generates a random number, sends it to a WebSocket server, and displays the response received(same data) from the server.

## Features

- **WebSocket Communication**: Sends the generated random number to a WebSocket server (`echo.websocket.org`) and receives the same number back from the server.
- **UI Display**: Displays the received data on the app screen.

## Installation

### Prerequisites

- Flutter SDK installed on your machine.
- A code editor like Visual Studio Code or Android Studio.

### Steps

1. **Clone the Repository**:

    git clone https://github.com/your-username/flutter-websocket-project.git
    cd flutter-websocket-project

2. **Install Dependencies**:

    Run the following command to install the required dependencies:
    1. Navigate to pubspec.yaml
    2. Under dependencies add 'web_socket_channel: ^2.1.0' with same indentation as 'flutter:'
    3. Go the the main folder of the project on terminal 'cd go/to/project/directory' and
    4. run 'flutter pub get' 

4. **Run the App**:
    Use the following command to run the app on your device or emulator:
    cd go/to/the/project/directory
    flutter run

## Usage

- Press the "Print" button to generate a random number and send it to the WebSocket server, then receive the same data and display it on the screen.

## Project Structure

- `lib/main.dart`: Entry point of the Flutter application.
- `lib/next_page.dart`: Contains the main logic for WebSocket communication and UI components.

## Branches

- `test`: A separate branch for testing and further development.

