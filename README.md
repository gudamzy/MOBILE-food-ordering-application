# Mobile Food Ordering Application

A simple mobile food ordering application developed using **Flutter** and **Dart**. The application allows users to create an account, log in, browse available food items, add items to their cart, and complete a simulated payment.

This project was developed as a mobile application project to demonstrate Flutter UI development, navigation, and local database integration using SQLite.

## Features

- User registration
- User login
- Continue as guest
- Browse food, drinks, and dessert
- Add items to cart
- View items in cart
- Remove items from cart
- Calculate total order price
- Clear cart
- Demo payment
- Local data storage using SQLite

## Technologies Used

- **Flutter**
- **Dart**
- **SQLite (sqflite)**
- **Path**
- **Material Design**

## Project Structure

```text
lib/
├── main.dart
├── login_page.dart
├── signup_page.dart
├── home.dart
├── cart.dart
├── database_helper.dart
├── profile.dart
└── view_data_page.dart

assets/
└── images/
```

### Main Files

| File | Description |
|---|---|
| `main.dart` | Main entry point of the application |
| `login_page.dart` | Handles user login and guest access |
| `signup_page.dart` | Handles new user registration |
| `home.dart` | Displays the main food ordering interface |
| `cart.dart` | Displays cart items and handles the demo payment |
| `database_helper.dart` | Handles SQLite database operations |
| `profile.dart` | Displays the user profile interface |
| `view_data_page.dart` | Displays stored application data |

## Application Flow

```text
Launch Application
        ↓
Login / Sign Up
        ↓
Home Page
        ↓
Browse Menu
        ↓
Add Item to Cart
        ↓
View Cart
        ↓
Calculate Total
        ↓
Demo Payment
        ↓
Payment Successful
```

## Local Database

The application uses **SQLite** through the `sqflite` package for local data storage.

The database is used to manage:

- User account information
- Cart items
- Item quantity and price

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/gudamzy/MOBILE-food-ordering-application.git
```

### 2. Open the project directory

```bash
cd MOBILE-food-ordering-application
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

Make sure Flutter is installed and an Android emulator or physical device is available before running the application.

## Payment

The payment function in this application is for **demonstration purposes only**. No real payment gateway or financial transaction is involved.

After a successful demo payment, the cart is cleared and a payment success message is displayed.

## Purpose

The purpose of this project is to demonstrate the development of a basic food ordering mobile application using Flutter. It focuses on user authentication, menu navigation, cart management, local database storage, and a simulated checkout process.

## Author

Developed as a student mobile application project.

## License

This project is intended for educational purposes.
