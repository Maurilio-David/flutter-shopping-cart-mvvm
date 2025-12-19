import 'package:desafio_tenda/features/products/domain/product.dart';

class ProductDto {
  final int id;
  final String title;
  final String image;
  final double price;

  ProductDto({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
    );
  }

  Product toEntity() {
    return Product(id: id, title: title, image: image, price: price);
  }
}
