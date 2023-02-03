import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_shop/src/core/services/snack_bar_service.dart';
import 'package:mobile_shop/src/data/api/api_service/api_services.dart';
import 'package:mobile_shop/src/data/models/FAQs.dart';
import 'package:mobile_shop/src/data/models/auth_response.dart';
import 'package:mobile_shop/src/data/models/banner.dart';
import 'package:mobile_shop/src/data/models/carts.dart';
import 'package:mobile_shop/src/data/models/favorite_response.dart';
import 'package:mobile_shop/src/data/models/home_response.dart';
import 'package:mobile_shop/src/data/models/notification_model.dart';
import 'package:mobile_shop/src/data/models/products.dart';
import 'package:mobile_shop/src/data/models/user.dart';
import 'package:mobile_shop/src/common%20widgets/dialog.dart';
import 'package:mobile_shop/src/utils/locator.dart';
import '../../data/api/api_constants/dio_exception.dart';
import '../../data/models/category.dart';
import '../../common widgets/alert.dart';
import '../services/navigation_service.dart';

class HomeDataProvider with ChangeNotifier {
  List<Banners> banners = [];
  List<Product> products = [];
  List<FavItems> favorites = [];
  List<Category> categoreis = [];
  List<CartItems> cartItems = [];
  List<Quastions> quastions = [];
  List<Notifications> notification = [];
  List<Product> categoryProducts = [];
  List<Product> searchProducts = [];

  int index = 0;
  File? image;
  FormData? formdata;
  bool isLoading = false;
  bool categoryLoading = false;
  bool profileDataLoading = false;
  User? user;
  Product? product;
  Carts? carts;
  int categoryIndex = 0;
  String? image4;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final searchController = TextEditingController();

  HomeDataProvider() {
    getHomeData();
    // getUserData();
    getFAvoriteData();
    // getCategories();
    // getCartsData();
    // getFAQsData();
    // getNotifications();
    // search("");
  }
  //--------------------------------    HOME DATA     -------------------------------------------

  getHomeData() async {
    try {
      isLoading = true;
      HomeResponse response = await locator<ApiServices>().getHomeData();
      if (response.status == true) {
        isLoading = false;
        banners = response.data!.banners!;
        products = response.data!.products!;
        notifyListeners();
      } else {
        isLoading = false;
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: response.message!),
        );
        notifyListeners();
      }
    } on DioError catch (err) {
      isLoading = false;
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    USER DATA     -------------------------------------------

  getUserData() async {
    try {
      isLoading = true;
      APIResponse response = await locator<ApiServices>().getUserData();
      if (response.status == true) {
        user = response.data;
        initControllers();
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: response.message!),
        );
        notifyListeners();
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------  ADD USER INFORMATION INTO CONTROLLERS     -------------------------------------------
  initControllers() {
    if (user != null) {
      phoneController.text = user!.phone!;
      emailController.text = user!.email!;
      nameController.text = user!.name!;
      passwordController.text = "220201852";
    } else {
      profileDataLoading = true;
    }
    notifyListeners();
  }

//--------------------------------  UPDATE IMAGE      -------------------------------------------
  pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageTemp = File(image!.path);
    this.image = imageTemp;

    // String fileName = imageTemp.path.split('/').last;
    // formdata = FormData.fromMap({
    //   "file": await MultipartFile.fromFile(imageTemp.path, filename: fileName),
    // });
    List<int> imageBytes = await imageTemp.readAsBytes();
    print(imageBytes);
    image4 = base64Encode(imageBytes);

    notifyListeners();
  }

  //-----------------------------  UPDATE  profile DATA ----------------------------------------
  updateProfile() async {
    try {
      final response = await locator<ApiServices>().updateProfile(
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
        image: image4,
      );

      if (response.status = true) {
        getUserData();
        locator<SnackBarSrevie>().showSnackBar(response.message!);
      } else {
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: response.message!),
        );
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    FAVORITE DATA     -------------------------------------------

  getFAvoriteData() async {
    try {
      final response = await locator<ApiServices>().getFavorite();
      if (response.status == true) {
        favorites = response.data!.items!;

        notifyListeners();
      } else {
        isLoading = false;
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: response.message!),
        );
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
    notifyListeners();
  }
  //--------------------------------    ADD PRODUCTS TO FAVORITE      -------------------------------------------

  addToFvorite(Product product) async {
    try {
      final response = await locator<ApiServices>().addToFavorites(product);
      if (response.status == true) {
        getFAvoriteData();
        HomeResponse response = await locator<ApiServices>().getHomeData();
        if (response.status == true) {
          products = response.data!.products!;
          notifyListeners();
        } else {
          isLoading = false;
          showDialog(
            context: locator<NavigationService>().navigatorKey.currentContext!,
            builder: (_) => CustomAlert(message: response.message!),
          );
        }
      } else {
        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: response.message!),
        );
      }
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    CATEGORIES      -------------------------------------------
  getCategories() async {
    try {
      categoryLoading = true;
      final categoriesResponse = await locator<ApiServices>().getCategories();
      if (categoriesResponse.status == true) {
        categoryLoading = false;
        categoreis = categoriesResponse.categories!.categories!;
        notifyListeners();
      } else {
        categoryLoading = false;

        showDialog(
          context: locator<NavigationService>().navigatorKey.currentContext!,
          builder: (_) => CustomAlert(message: categoriesResponse.message!),
        );
      }
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
    notifyListeners();
  }

  //--------------------------------    PRODUCT DETAILS      -------------------------------------------
  getProduct(int id) async {
    try {
      final response = await locator<ApiServices>().getProductDetails(id);
      product = response.product;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    CARTS     -------------------------------------------
  getCartsData() async {
    try {
      final response = await locator<ApiServices>().getCartsData();
      cartItems = response.carts!.cartItems!;
      carts = response.carts!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  } //--------------------------------  ADD TO  CARTS     -------------------------------------------

  addToCart(int id) async {
    try {
      final response = await locator<ApiServices>().addToCarts(id);
      locator<SnackBarSrevie>().showSnackBar(response.message!);
      getCartsData();
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    FAQS DATA      -------------------------------------------
  getFAQsData() async {
    try {
      final response = await locator<ApiServices>().getFAQs();
      quastions = response.data!.data!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    NOTIFICATIONS      -------------------------------------------
  getNotifications() async {
    try {
      final response = await locator<ApiServices>().notification();
      notification = response.data!.notifications!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    CATEGORIES DETAILS        -------------------------------------------
  getCategoryDetails(int id) async {
    try {
      final response = await locator<ApiServices>().categoryDetails(id);
      categoryProducts = response.data!.product!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }

  //--------------------------------    Search products        -------------------------------------------
  search(String text) async {
    try {
      final response = await locator<ApiServices>().searchProduct(text);
      searchProducts = response.data!.data!;
      notifyListeners();
    } on DioError catch (err) {
      final errorMessage = DioException.fromDioError(err).toString();
      MyDialog.showDialog(
        locator<NavigationService>().navigatorKey.currentContext!,
        errorMessage,
      );
    }
  }
}
