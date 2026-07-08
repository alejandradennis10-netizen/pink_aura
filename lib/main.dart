import 'package:flutter/material.dart';

void main() {
  runApp(const CosmeticApp());
}

class CosmeticApp extends StatelessWidget {
  const CosmeticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cosmetics CRUD System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

// ==========================================
// 1. MODELOS DE DATOS (Basado en ER Diagram)
// ==========================================

class Category {
  final int categoryId;
  final String categoryName;

  Category({required this.categoryId, required this.categoryName});
}

class Brand {
  final int brandId;
  final String brandName;

  Brand({required this.brandId, required this.brandName});
}

class CosmeticProduct {
  final int productId;
  String productName;
  String description;
  double price;
  int stock;
  DateTime expirationDate;
  int categoryId;
  int brandId;
  String imageUrl;

  CosmeticProduct({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.stock,
    required this.expirationDate,
    required this.categoryId,
    required this.brandId,
    required this.imageUrl,
  });
}

// ==========================================
// 2. MOCK DATA & REPOSITORIO (Simulación DB)
// ==========================================

class MockDatabase {
  static List<Category> categories = [
    Category(categoryId: 1, categoryName: 'Makeup'),
    Category(categoryId: 2, categoryName: 'Skincare'),
    Category(categoryId: 3, categoryName: 'Hair Care'),
  ];

  static List<Brand> brands = [
    Brand(brandId: 1, brandName: 'L\'Oréal'),
    Brand(brandId: 2, brandName: 'Maybelline'),
    Brand(brandId: 3, brandName: 'Nivea'),
  ];

  static List<CosmeticProduct> products = [
    CosmeticProduct(
      productId: 101,
      productName: 'Matte Liquid Lipstick',
      description: 'Long-lasting matte lipstick with rich pigment.',
      price: 15.99,
      stock: 25,
      expirationDate: DateTime(2027, 12, 31),
      categoryId: 1,
      brandId: 2,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    CosmeticProduct(
      productId: 102,
      productName: 'Hydrating Face Cream',
      description: 'Deep moisturizing face cream for all skin types.',
      price: 22.50,
      stock: 0, // Out of stock
      expirationDate: DateTime(2028, 05, 15),
      categoryId: 2,
      brandId: 3,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];
}

// ==========================================
// 3. PANTALLA DE AUTENTICACIÓN (FR-01)
// ==========================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProductListScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid email and password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cosmetic System - Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.brush, size: 80, color: Colors.pinkAccent),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 4. LISTA Y BÚSQUEDA DE PRODUCTOS (FR-02, FR-04)
// ==========================================

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String searchQuery = '';
  int? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    // Filtrar por nombre y por categoría
    final filteredProducts = MockDatabase.products.where((p) {
      final matchesSearch = p.productName.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesCategory = selectedCategoryId == null || p.categoryId == selectedCategoryId;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cosmetic Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search product by name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => setState(() => searchQuery = val),
            ),
          ),
          // Filtro por categoría
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: const Text('All'),
                    selected: selectedCategoryId == null,
                    onSelected: (_) => setState(() => selectedCategoryId = null),
                  ),
                ),
                ...MockDatabase.categories.map((c) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ChoiceChip(
                        label: Text(c.categoryName),
                        selected: selectedCategoryId == c.categoryId,
                        onSelected: (_) => setState(() => selectedCategoryId = c.categoryId),
                      ),
                    )),
              ],
            ),
          ),
          const Divider(),
          // Lista de productos (Epic 2)
          Expanded(
            child: filteredProducts.isEmpty
                ? const Center(child: Text('No products found'))
                : ListView.builder(
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      final brand = MockDatabase.brands.firstWhere(
                        (b) => b.brandId == product.brandId,
                        orElse: () => Brand(brandId: 0, brandName: 'Unknown'),
                      );
                      final isOutOfStock = product.stock == 0;

                      return ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.sanitizer)),
                        title: Text(product.productName),
                        subtitle: Text('${brand.brandName} - \$${product.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Chip(
                              label: Text(isOutOfStock ? 'Out of stock' : 'Stock: ${product.stock}'),
                              backgroundColor: isOutOfStock ? Colors.red.shade100 : Colors.green.shade100,
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteProduct(product.productId),
                            ),
                          ],
                        ),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductFormScreen(product: product),
                            ),
                          );
                          setState(() {});
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Epic 4: Delete Cosmetic Product
  void _deleteProduct(int productId) {
    setState(() {
      MockDatabase.products.removeWhere((p) => p.productId == productId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product deleted successfully')),
    );
  }
}

// ==========================================
// 5. FORMULARIO CREATE / UPDATE (Epic 1 & 3)
// ==========================================

class ProductFormScreen extends StatefulWidget {
  final CosmeticProduct? product;

  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _description;
  late double _price;
  late int _stock;
  int? _selectedCategory;
  int? _selectedBrand;

  @override
  void initState() {
    super.initState();
    _name = widget.product?.productName ?? '';
    _description = widget.product?.description ?? '';
    _price = widget.product?.price ?? 0.0;
    _stock = widget.product?.stock ?? 0;
    _selectedCategory = widget.product?.categoryId ?? MockDatabase.categories.first.categoryId;
    _selectedBrand = widget.product?.brandId ?? MockDatabase.brands.first.brandId;
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (widget.product == null) {
        // Epic 1: Create Product
        final newProduct = CosmeticProduct(
          productId: DateTime.now().millisecondsSinceEpoch,
          productName: _name,
          description: _description,
          price: _price,
          stock: _stock,
          expirationDate: DateTime.now().add(const Duration(days: 365)),
          categoryId: _selectedCategory!,
          brandId: _selectedBrand!,
          imageUrl: '',
        );
        MockDatabase.products.add(newProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product registered successfully')),
        );
      } else {
        // Epic 3: Update Product
        widget.product!.productName = _name;
        widget.product!.description = _description;
        widget.product!.price = _price;
        widget.product!.stock = _stock;
        widget.product!.categoryId = _selectedCategory!;
        widget.product!.brandId = _selectedBrand!;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Product updated successfully')),
        );
      }

      Navigator.pop(context);
    } else {
      // Unsuccessful scenario handling
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.product != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Product' : 'Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _name,
                  decoration: const InputDecoration(labelText: 'Product Name *'),
                  validator: (val) => val == null || val.isEmpty ? 'Required field' : null,
                  onSaved: (val) => _name = val!,
                ),
                TextFormField(
                  initialValue: _description,
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (val) => _description = val ?? '',
                ),
                TextFormField(
                  initialValue: _price == 0 ? '' : _price.toString(),
                  decoration: const InputDecoration(labelText: 'Price (\$) *'),
                  keyboardType: TextInputType.number,
                  validator: (val) => val == null || val.isEmpty ? 'Required field' : null,
                  onSaved: (val) => _price = double.tryParse(val!) ?? 0.0,
                ),
                TextFormField(
                  initialValue: _stock == 0 ? '' : _stock.toString(),
                  decoration: const InputDecoration(labelText: 'Stock Quantity *'),
                  keyboardType: TextInputType.number,
                  validator: (val) => val == null || val.isEmpty ? 'Required field' : null,
                  onSaved: (val) => _stock = int.tryParse(val!) ?? 0,
                ),
                DropdownButtonFormField<int>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: MockDatabase.categories
                      .map((c) => DropdownMenuItem(value: c.categoryId, child: Text(c.categoryName)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedCategory = val),
                ),
                DropdownButtonFormField<int>(
                  value: _selectedBrand,
                  decoration: const InputDecoration(labelText: 'Brand'),
                  items: MockDatabase.brands
                      .map((b) => DropdownMenuItem(value: b.brandId, child: Text(b.brandName)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedBrand = val),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _saveProduct,
                  style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                  child: Text(isEditing ? 'Update' : 'Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
