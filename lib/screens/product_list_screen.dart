import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'product_form_screen.dart';
import '../widgets/delete_confirmation_dialog.dart';
import 'product_details_screen.dart';
import '../services/product_service.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductService _service = ProductService();
  List<Product> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      setState(() => isLoading = true);
      final loadedProducts = await _service.getProducts();
      setState(() {
        products = loadedProducts;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      _showErrorDialog('Erro ao carregar produtos');
    }
  }

  void _addProduct() async {
    final result = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (context) => const ProductFormScreen()),
    );

    if (result != null) {
      try {
        await _service.createProduct(result);
        _loadProducts(); // Recarrega a lista após criar
        _showSuccessMessage('Produto adicionado com sucesso');
      } catch (e) {
        _showErrorDialog('Erro ao adicionar produto');
      }
    }
  }

  void _editProduct(Product product) async {
    final result = await Navigator.push<Product>(
      context,
      MaterialPageRoute(
        builder: (context) => ProductFormScreen(product: product),
      ),
    );

    if (result != null) {
      try {
        await _service.updateProduct(product.id, result);
        _loadProducts(); // Recarrega a lista após atualizar
        _showSuccessMessage('Produto atualizado com sucesso');
      } catch (e) {
        _showErrorDialog('Erro ao atualizar produto');
      }
    }
  }

  void _deleteProduct(Product product) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => const DeleteConfirmationDialog(),
    );

    if (confirm == true) {
      try {
        await _service.deleteProduct(product.id);
        _loadProducts(); // Recarrega a lista após deletar
        _showSuccessMessage('Produto deletado com sucesso');
      } catch (e) {
        _showErrorDialog('Erro ao deletar produto');
      }
    }
  }

  void _showErrorDialog(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onEdit: () => _editProduct(product),
                  onDelete: () => _deleteProduct(product),
                  onTap: () => _showDetails(product),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
