import 'dart:io';
import 'package:dio/dio.dart';
import 'package:mobile_shop/src/data/api/api_constants/constants.dart';
import 'package:mobile_shop/src/data/models/FAQs.dart';
import 'package:mobile_shop/src/data/models/add_cart_response.dart';
import 'package:mobile_shop/src/data/models/auth_response.dart';
import 'package:mobile_shop/src/data/models/banner.dart';
import 'package:mobile_shop/src/data/models/carts.dart';
import 'package:mobile_shop/src/data/models/categories_response.dart';
import 'package:mobile_shop/src/data/models/category_details_response.dart';
import 'package:mobile_shop/src/data/models/home_response.dart';
import 'package:mobile_shop/src/data/models/notification_model.dart';
import 'package:mobile_shop/src/data/models/product_details.dart';
import 'package:mobile_shop/src/data/models/products.dart';
import 'package:mobile_shop/src/data/models/search_response.dart';

import '../../../core/services/storage_services.dart';
import '../../../utils/locator.dart';
import '../../models/favorite_response.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "lang": "en",
      },
    ),
  );

//--------------------------------     GET TOKEN       ---------------------------------------------

  Future<String> getToken() async {
    String token = await locator<SpService>().readString('token');
    return token;
  }

//--------------------------------     SIGN UP       ---------------------------------------------
  Future<APIResponse> signUp({
    required String email,
    required String phone,
    required String fullName,
    required String password,
  }) async {
    final response = await _dio.post(ApiConstants.signUpEndpoint, data: {
      "name": fullName,
      "phone": phone,
      "email": email,
      "password": password,
    });
    APIResponse signupResponse = APIResponse.fromJson(response.data);
    return signupResponse;
  }

//--------------------------------    LOGIN     -------------------------------------------------
  Future<APIResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(ApiConstants.loginEndpoint, data: {
      'email': email,
      'password': password,
    });

    APIResponse loginResponse = APIResponse.fromJson(response.data);
    return loginResponse;
  }
//--------------------------------    LOGOUT     -------------------------------------------------

  Future<APIResponse> logout() async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.post(
      ApiConstants.logoutEndpoint,
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    APIResponse logoutResponse = APIResponse.fromJson(response.data);
    return logoutResponse;
  }

//--------------------------------    HOME DATA     ----------------------------------------------
  Future<HomeResponse> getHomeData() async {
    String? token = await locator<SpService>().getToken();

    final response = await _dio.get(
      ApiConstants.homeEndpoint,
      options: Options(
        headers: {
          'Authorization': token,
        },
      ),
    );
    HomeResponse homeResponse = HomeResponse.fromJson(response.data);
    return homeResponse;
  }

//--------------------------------    PROFILE DATA     -------------------------------------------
  Future<APIResponse> getUserData() async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      ApiConstants.profileEndpoint,
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    APIResponse profileResponse = APIResponse.fromJson(response.data);
    return profileResponse;
  }

  //--------------------------------    UPDATE PROFILE DATA     ----------------------------------------------
  Future<APIResponse> updateProfile({
    required String name,
    required String phone,
    required String email,
    required String password,
    required image,
  }) async {
    String? token = await locator<SpService>().getToken();

    final response = await _dio.put(
      ApiConstants.updateProfileEndpoint,
      data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": password,
        "image": image
      },
      options: Options(
        headers: {
          'Authorization': token,
          HttpHeaders.allowHeader: 'application/json',
        },
      ),
    );
    APIResponse newUserData = APIResponse.fromJson(response.data);
    return newUserData;
  }

//--------------------------------    FAVORITE DATA     -------------------------------------------
  Future<FavoriteRsponse> getFavorite() async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      ApiConstants.favoriteEndpoint,
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    FavoriteRsponse favoriteResponse = FavoriteRsponse.fromJson(response.data);
    return favoriteResponse;
  }

  //--------------------------------    ADD  TO FAVORITE DATA     -------------------------------------------
  Future<FavoriteRsponse> addToFavorites(Product product) async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.post(
      ApiConstants.favoriteEndpoint,
      data: {"product_id": product.id},
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    FavoriteRsponse favoriteResponse = FavoriteRsponse.fromJson(response.data);
    return favoriteResponse;
  }

  //--------------------------------    CATEGORIES      -------------------------------------------
  Future<CategoriesResponse> getCategories() async {
    final response = await _dio.get(ApiConstants.categoriesEndpoint);
    CategoriesResponse categoriesResponse =
        CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
  }

  //--------------------------------    PRODUCT DETAILS      -------------------------------------------
  Future<ProductDetailsModel> getProductDetails(int id) async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      '${ApiConstants.productDetailsEndpoint}/$id',
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    ProductDetailsModel productResponse =
        ProductDetailsModel.fromJson(response.data);
    return productResponse;
  }

  //--------------------------------    CART       -------------------------------------------
  Future<CartsResponse> getCartsData() async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      ApiConstants.cartsEndpoint,
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    CartsResponse cartsResponse = CartsResponse.fromJson(response.data);
    return cartsResponse;
  }

  //--------------------------------    ADD TO CART      -------------------------------------------
  Future<AddToCartResponse> addToCarts(int id) async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.post(ApiConstants.cartsEndpoint,
        options: Options(
          headers: {'Authorization': token},
        ),
        data: {'product_id': id});
    AddToCartResponse cartResponse = AddToCartResponse.fromJson(response.data);
    return cartResponse;
  }

  //--------------------------------    FAQS DATA      -------------------------------------------
  Future<FAQsResponse> getFAQs() async {
    final response = await _dio.get(ApiConstants.faqsEndpoint);
    FAQsResponse faqs = FAQsResponse.fromJson(response.data);
    return faqs;
  }

  //--------------------------------    NOTIFICATIONS      -------------------------------------------
  Future<NotificationResponse> notification() async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      ApiConstants.notificationsEndpoint,
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    NotificationResponse notificationResponse =
        NotificationResponse.fromJson(response.data);
    return notificationResponse;
  }

  //--------------------------------    CATEGORIES DETAILS        -------------------------------------------
  Future<CategoryDetailsResponse> categoryDetails(int id) async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.get(
      '${ApiConstants.categoryDetailsEndpoint}/$id',
      options: Options(
        headers: {'Authorization': token},
      ),
    );
    CategoryDetailsResponse categoryDetailsResponse =
        CategoryDetailsResponse.fromJson(response.data);
    return categoryDetailsResponse;
  }

  //--------------------------------    CATEGORIES DETAILS        -------------------------------------------
  Future<BannersResponse> getBanners(int id) async {
    final response = await _dio.get(
      ApiConstants.categoryDetailsEndpoint,
    );
    BannersResponse bannersResponse = BannersResponse.fromJson(response.data);
    return bannersResponse;
  }

  //--------------------------------    SEARCH       -------------------------------------------
  Future<SearchResponse> searchProduct(String text) async {
    String? token = await locator<SpService>().getToken();
    final response = await _dio.post(ApiConstants.searchEndpoint,
        options: Options(
          headers: {'Authorization': token},
        ),
        data: {'text': text});
    SearchResponse searchResponse = SearchResponse.fromJson(response.data);
    return searchResponse;
  }

  //--------------------------------    ADDRESS DATA      -------------------------------------------
  Future<Response> addressData() async {
    try {
      String? token = await locator<SpService>().getToken();
      final response = await _dio.get(
        ApiConstants.addressesEndpoint,
        options: Options(
          headers: {'Authorization': token},
        ),
      );
      print(response);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
