import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/products_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join (
      dbPath,
      'food_app.db',
    );
    return await openDatabase (
      path,
      version: 1,
      onCreate: _createDatabase,
    );
    }

  Future<void> _createDatabase(
      Database db,
      int version,
      ) async {
      await db.execute('''
       CREATE TABLE Products (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        price REAL,
        discountPercentage REAL,
        rating REAL,
        stock INTEGER,
        category TEXT,
        brand TEXT,
        thumbnail TEXT,
        images TEXT
      )   
    ''');
  }

      Future<void> insertProduct(Product product) async {
        final db = await database;

        await db.insert(
          'products',
          {
            'id': product.id,
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'discountPercentage': product.discountPercentage,
            'rating': product.rating,
            'stock': product.stock,
            'category': product.category,
            'brand': product.brand,
            'thumbnail': product.thumbnail,
            'images': product.images.join(','),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      Future<void> insertProducts(List<Product> products) async {
        for (final product in products) {
          await insertProduct(product);
        }
      }

      Future<List<Product>> getProducts() async {
        final db = await database;

        final List<Map<String, dynamic>> maps =
        await db.query('Products');

        return List.generate(
          maps.length,
              (index) {
            return Product(
              id: maps[index]['id'],
              title: maps[index]['title'],
              description: maps[index]['description'],
              price: maps[index]['price'],
              discountPercentage: maps[index]['discountPercentage'],
              rating: maps[index]['rating'],
              stock: maps[index]['stock'],
              category: maps[index]['category'],
              brand: maps[index]['brand'],
              thumbnail: maps[index]['thumbnail'],
              images: maps[index]['images'].toString().split(','),
            );
          },
        );
      }
  }
