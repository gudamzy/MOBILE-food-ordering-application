import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('food_order.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {

  await db.execute('''
    CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      email TEXT NOT NULL,
      password TEXT NOT NULL
    )
  ''');

  await db.execute('''
    CREATE TABLE cart(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      foodName TEXT NOT NULL,
      price REAL NOT NULL,
      quantity INTEGER NOT NULL
    )
  ''');
}

Future<int> registerUser(
  String email,
  String password,
) async {

  final db = await database;

  return await db.insert(
    'users',
    {
      'email': email,
      'password': password,
    },
  );
}

Future<bool> loginUser(
  String email,
  String password,
) async {

  final db = await database;

  final result = await db.query(
    'users',
    where: 'email = ? AND password = ?',
    whereArgs: [email, password],
  );

  return result.isNotEmpty;
}

  // ADD TO CART
  Future<int> addToCart(
    String foodName,
    double price,
    int quantity,
  ) async {
    final db = await database;

    return await db.insert(
      'cart',
      {
        'foodName': foodName,
        'price': price,
        'quantity': quantity,
      },
    );
  }

  // VIEW CART
  Future<List<Map<String, dynamic>>> getCartItems() async {
    final db = await database;

    return await db.query('cart');
  }

  // DELETE ITEM
  Future<int> deleteCartItem(int id) async {
    final db = await database;

    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CLEAR CART
  Future<int> clearCart() async {
    final db = await database;

    return await db.delete('cart');
  }

  // CALCULATE TOTAL
  Future<double> getTotalPrice() async {
    final db = await database;

    final result = await db.rawQuery('''
      SELECT SUM(price * quantity) as total
      FROM cart
    ''');

    final total = result.first['total'];

    if (total == null) {
      return 0.0;
    }

    return (total as num).toDouble();
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}