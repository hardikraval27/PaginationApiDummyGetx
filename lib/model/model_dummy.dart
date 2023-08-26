class mydumy {
  String? id;
  String? title;
  String? description;
  String? price;
  double? discountPercentage;
  double? rating;
  String? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  mydumy(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images});

  mydumy.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'].toString();
    description = json['description'].toString();
    price = json['price'].toString();
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'].toString();
    brand = json['brand'].toString();
    category = json['category'].toString();
    thumbnail = json['thumbnail'].toString();
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPercentage'] = this.discountPercentage;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    data['brand'] = this.brand;
    data['category'] = this.category;
    data['thumbnail'] = this.thumbnail;
    data['images'] = this.images;
    return data;
  }
}
