import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  static const String baseUrl = 'http://localhost:13000';

  // Headers corretos
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Função auxiliar para converter preço
  double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is num) return price.toDouble();
    if (price is String) {
      return double.tryParse(price.replaceAll(',', '.')) ?? 0.0;
    }
    return 0.0;
  }

  Future<List<Product>> getProducts() async {
    try {
      print('Iniciando requisição GET para $baseUrl');

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: _headers,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Headers: ${response.headers}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList
            .map((json) => Product(
                  id: json['id'].toString(),
                  description: json['descricao'] ?? json['name'] ?? '',
                  price: _parsePrice(json['preco']),
                  stock: json['estoque'] is int
                      ? json['estoque']
                      : int.tryParse(json['estoque'].toString()) ?? 0,
                  createdAt: DateTime.parse(json['data']),
                ))
            .toList();
      } else {
        throw Exception('Falha ao carregar produtos: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro na requisição: $e');
      rethrow;
    }
  }

  Future<void> createProduct(Product product) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: _headers,
        body: json.encode({
          'name': product.description,
          'desc': product.description,
          'preco': product.price.toString(),
          'estoque': product.stock,
        }),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Falha ao criar produto: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao criar produto: $e');
      rethrow;
    }
  }

  Future<void> updateProduct(String id, Product product) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: _headers,
        body: json.encode({
          'name': product.description,
          'desc': product.description,
          'preco': product.price.toString(),
          'estoque': product.stock,
        }),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Falha ao atualizar produto: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao atualizar produto: $e');
      rethrow;
    }
  }

  Future<void> deleteProduct(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$id'),
        headers: _headers,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Falha ao deletar produto: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao deletar produto: $e');
      rethrow;
    }
  }
}
