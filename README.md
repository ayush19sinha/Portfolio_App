# My Portfolio App 📈

My Portfolio App is a Flutter-based mobile application that allows users to track their investment portfolio by adding, viewing, and managing investment records. The app provides real-time updates on the growth and performance of each investment, making it easy for users to stay informed about their financial assets.

## Features 🚀

- **Add Investments**: Users can add investment records by entering essential details such as investment name, amount invested, and current value.
- **Portfolio Overview**: See a summary of all investments and view total portfolio value.
- **Detailed Investment View**: Access detailed information on each investment, including current value, total gain/loss, and growth percentage.
- **Delete Investments**: Easily remove investments from the portfolio with a confirmation prompt.
- **Local Data Persistence**: Data is saved locally using SharedPreferences, allowing users to retrieve investment records even after restarting the app.

## Video of the app 📷



https://github.com/user-attachments/assets/6b6901c1-c544-4a80-9f9c-27a49bf80fec



## Getting Started 🛠️

Follow these steps to set up and run My Portfolio App on your local machine.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A device or emulator for testing

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ayush19sinha/Portfolio_App.git
   cd my-portfolio-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

## Folder Structure 📂

- **lib/models**: Defines the data structure for investment.
- **lib/providers**: Contains the `InvestmentProvider` which manages investment data and state.
- **lib/screens**: All UI screens including add and details screens.
- **lib/widgets**: Custom widgets used throughout the app, like `DetailRow` for displaying investment details.

## Usage 📝

1. **Adding Investments**:
   - Go to the "Add Investment" screen by tapping the floating action button, fill out the form, and hit "Save Investment."
   
2. **Viewing Investments**:
   - From the main screen, tap on an investment to see details like gain/loss and growth percentage.

3. **Deleting Investments**:
   - Tap the delete icon on the investment details screen to remove an entry.

## Built With 🛠️

- **Flutter**: UI toolkit for building natively compiled applications for mobile from a single codebase.
- **Provider**: State management solution for managing investment data.

## Testing ✅

Run unit tests to validate the investment calculation logic:

```bash
flutter test
```

## Contributing 🤝

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/ayush19sinha/Portfolio_App/issues).

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
