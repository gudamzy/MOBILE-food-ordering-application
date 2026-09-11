# 🍔 Mobile Food Ordering Application

A mobile food ordering application developed using **Flutter** and **Dart**. The application allows users to create an account, log in, browse food, drinks and desserts, add items to a shopping cart, and complete a simulated payment.

The project demonstrates mobile application development using Flutter, including user interface design, navigation, local database storage and cart management.

---

## 📱 Features

- User registration
- User login
- Continue as guest
- Browse menu by category
  - Food
  - Drinks
  - Dessert
- View item details
- View item prices
- Add items to cart
- View cart items
- Remove items from cart
- Calculate total order price
- Clear cart after payment
- Simulated payment
- Local data storage using SQLite

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Flutter | Mobile application framework |
| Dart | Programming language |
| SQLite | Local database |
| sqflite | Flutter SQLite package |
| path | Database path management |
| Material Design | User interface components |

---

## 📂 Project Structure

```text
MOBILE-food-ordering-application/
│
├── android/
├── assets/
│   └── images/
│
├── ios/
├── lib/
│   ├── main.dart
│   ├── home.dart
│   ├── cart.dart
│   ├── database_helper.dart
│   ├── login_page.dart
│   ├── signup_page.dart
│   ├── profile.dart
│   └── view_data_page.dart
│
├── web/
├── windows/
├── pubspec.yaml
└── README.md
```

---

## 🧩 Main Components

| File | Description |
|---|---|
| `main.dart` | Main entry point and navigation of the application |
| `home.dart` | Displays Food, Drinks and Dessert menus |
| `cart.dart` | Displays cart items, total price and payment function |
| `database_helper.dart` | Handles SQLite database operations |
| `login_page.dart` | Handles user login and guest access |
| `signup_page.dart` | Handles new user registration |
| `profile.dart` | Displays the user profile interface |
| `view_data_page.dart` | Displays stored application data |

---

## 🍽️ Menu Categories

The menu is divided into three categories.

### Food

- Burger Special
- Laksa Utara
- Mee Kari
- Mee Hoon Sup
- Nasi Lemak
- Chicken Chop

### Drinks

- Teh Ais
- Milo Ais
- Nescafe Ais
- Sirap Bandung
- Orange Juice
- Mineral Water

### Dessert

- Chocolate Cake
- Cheesecake
- Brownies
- Pudding
- Donut
- Ice Cream

---

## 🔄 Application Flow

```text
Launch Application
        │
        ▼
Login / Sign Up
        │
        ├── Continue as Guest
        │
        ▼
     Home Page
        │
        ▼
Browse Food / Drinks / Dessert
        │
        ▼
View Item Details
        │
        ▼
   Add To Cart
        │
        ▼
     View Cart
        │
        ▼
Calculate Total Price
        │
        ▼
    Demo Payment
        │
        ▼
 Payment Successful
```

---

## 🗄️ Local Database

The application uses **SQLite** through the `sqflite` package for local data storage.

The database is used to manage information such as:

- User accounts
- Cart items
- Food names
- Item prices
- Item quantities

Using a local database allows the application to store and retrieve data directly on the device without requiring an external database server.

---

## 🛒 Cart System

When a user selects an item, the item can be added to the shopping cart.

Each cart record contains:

```text
Food Name
Price
Quantity
```

Users can view their selected items, remove unwanted items and see the total price of the current order.

---

## 💳 Payment

The payment feature is implemented for **demonstration purposes only**.

No real payment gateway, bank account or financial transaction is involved.

When the user presses the **Payment** button:

1. The demo payment is processed.
2. The cart is cleared.
3. The total price is reset.
4. A `Payment Successful (Demo)` message is displayed.

---

## ▶️ How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/gudamzy/MOBILE-food-ordering-application.git
```

### 2. Enter the project directory

```bash
cd MOBILE-food-ordering-application
```

### 3. Install Flutter dependencies

```bash
flutter pub get
```

### 4. Run the application

```bash
flutter run
```

Make sure **Flutter SDK** is installed and an Android emulator or physical device is available.

---

## 📦 Main Dependencies

The project uses Flutter packages including:

```yaml
sqflite
path
```

Run the following command to install all dependencies defined in `pubspec.yaml`:

```bash
flutter pub get
```

---

## 🎯 Project Purpose

The purpose of this project is to demonstrate the development of a basic mobile food ordering application using Flutter.

The project focuses on:

- Flutter user interface development
- Page navigation
- User registration and login
- Local database integration
- Menu presentation
- Shopping cart management
- Basic checkout simulation

---

## ⚠️ Limitations

This application is developed as an educational project.

Current limitations include:

- Payment is simulated and does not use a real payment gateway.
- Data is stored locally on the device.
- The application does not connect to a restaurant backend server.
- Orders are not sent to an actual restaurant.
- Real-time order tracking is not implemented.

---

## 📄 License

This project is developed for educational purposes.
