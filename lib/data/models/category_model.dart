import '../../domain/entities/category_entity.dart';

class CategoriesModel extends CategoriesEntity{


  CategoriesModel({statusCode, categories}):super(statusCode: statusCode,categories: categories);

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add( Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
