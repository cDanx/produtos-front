import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/formatters.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Produto'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDetailCard(
            title: 'ID',
            content: product.id,
          ),
          _buildDetailCard(
            title: 'Descrição',
            content: product.description,
          ),
          _buildDetailCard(
            title: 'Preço',
            content: formatPrice(product.price),
          ),
          _buildDetailCard(
            title: 'Estoque',
            content: product.stock.toString(),
          ),
          _buildDetailCard(
            title: 'Data de Criação',
            content: formatDate(product.createdAt),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard({required String title, required String content}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}