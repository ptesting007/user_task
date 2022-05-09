import 'dart:convert';

import 'package:dio/dio.dart';
import 'ApiStrategy.dart';

class ApiService {
  factory ApiService() => _getInstance();

  static ApiService get instance => _getInstance();
  static ApiService _instance = ApiService._internal();

  static final int requestSucceed = 0;
  static final int requestFailed = 1;

  ApiService._internal();

  static ApiService _getInstance() {
    return _instance;
  }

  static void get(
    String url, {
    Function? success,
    Function? failed,
    Function? error,
    Map<String, dynamic>? params,
    CancelToken? token,
    int? startPage,
  }) {
    ApiStrategy.getInstance().get(
      url,
      (data) {
        success!(jsonEncode(data));
      },
      params: params,
      errorCallBack: (errorMessage) {
        error!(errorMessage);
      },
      token: token,
    );
  }

  static void post(String url,
      {FormData? formData,
      Map<String, dynamic>? param,
      Map<String, dynamic>? queryParams,
      Function? success,
      Function? failed,
      Function? error,
      CancelToken? token,
        bool addHeader = false,
      }) {
    ApiStrategy.getInstance().post(
        url,
        (data) {
          if (data["Status"] == false) {
            failed!(data);
          } else {
            success!(data);
          }
        },
        (count, total) {},
        params: param,
        formData: formData,
        queryParams: queryParams,
        errorCallBack: (errorMessage) {
          error!(errorMessage);
        },
      addHeader: addHeader,
    );
  }



  static void put(String url,
      {FormData? formData,
        Map<String, dynamic>? param,
        Map<String, dynamic>? queryParams,
        Function? success,
        Function? failed,
        Function? error,
        CancelToken? token}) {
    ApiStrategy.getInstance().put(
        url,
            (data) {
          if (data["Status"] == false) {
            failed!(data);
          } else {
            success!(data);
          }
        },
            (count, total) {},
        params: param,
        formData: formData,
        queryParams: queryParams,
        errorCallBack: (errorMessage) {
          error!(errorMessage);
        });
  }

}
