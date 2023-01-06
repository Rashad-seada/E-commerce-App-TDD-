import 'package:equatable/equatable.dart';
import 'package:evira/core/entities/entities.dart';

class CategoriesEntity {
  int? statusCode;
  List<Categories>? categories;

  CategoriesEntity({this.statusCode, this.categories});


}

class Categories {
  int? id;
  String? categoriesName;
  List<CategoriesSections>? categoriesSections;

  Categories({this.id, this.categoriesName, this.categoriesSections});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoriesName = json['categories_name'];
    if (json['categories_sections'] != null) {
      categoriesSections = <CategoriesSections>[];
      json['categories_sections'].forEach((v) {
        categoriesSections!.add(new CategoriesSections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categories_name'] = this.categoriesName;
    if (this.categoriesSections != null) {
      data['categories_sections'] =
          this.categoriesSections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesSections {
  int? sectionId;
  String? sectionName;

  CategoriesSections({this.sectionId, this.sectionName});

  CategoriesSections.fromJson(Map<String, dynamic> json) {
    sectionId = json['section_id'];
    sectionName = json['section_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section_id'] = this.sectionId;
    data['section_name'] = this.sectionName;
    return data;
  }
}