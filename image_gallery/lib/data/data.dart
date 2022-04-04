import 'package:image_gallery/model/category_model.dart';

List<CategoryModel> categoryList = [];
CategoryModel categoryModel = CategoryModel();

const String nUrl =
    "https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";
const String sUrl =
    "https://images.pexels.com/photos/4142/cute-cuddly-toy-cartoon-costume.jpg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";
const String fUrl =
    "https://images.pexels.com/photos/1536619/pexels-photo-1536619.jpeg?auto=compress&cs=tinysrgb&w=300";
const String stUrl =
    "https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";
const String mUrl =
    "https://images.pexels.com/photos/1081685/pexels-photo-1081685.jpeg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";
const String pUrl =
    "https://images.pexels.com/photos/853168/pexels-photo-853168.jpeg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";
const String foUrl =
    "https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=300&h=150&dpr=1";

List<CategoryModel> getCategory() {
//  List of categories
  Inserter(title: "Nature", url: nUrl).insert();
  Inserter(title: "Single", url: sUrl).insert();
  Inserter(title: "Fashion", url: fUrl).insert();
  Inserter(title: "Street", url: stUrl).insert();
  Inserter(title: "Model", url: mUrl).insert();
  Inserter(title: "People", url: pUrl).insert();
  Inserter(title: "Food", url: foUrl).insert();

  return categoryList;
}

class Inserter {
  String title;
  String url;

  Inserter({required this.title, required this.url});
  void insert() {
    categoryModel.categoryTitle = title;
    categoryModel.imgUrl = url;
    categoryList.add(categoryModel);
    categoryModel = CategoryModel();
  }
}
