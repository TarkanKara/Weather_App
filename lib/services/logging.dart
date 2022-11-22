// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:dio/dio.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class Loggining extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("${options.method} => ${options.path} ");
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    return super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "RESPONSE ${response.statusCode} => ${response.requestOptions.path} ");

    switch (response.statusCode) {
      case 200:
        _oneContextShowDialog("200", "İstek Başarılı");
        /* showSnackBar(
            builder: (_) =>
                const SnackBar(content: Text('My awesome snackBar!'))); */
        break;
      case 400:
        _oneContextShowDialog("400", "istek Geçersiz");
        break;
      case 401:
        _oneContextShowDialog("401", "Yetkisiz");
        break;
      case 403:
        _oneContextShowDialog("403", "Yasaklı");
        break;
      case 404:
        _oneContextShowDialog("404", "Sayfa Bulunamadı");
        break;
      case 500:
        _oneContextShowDialog("500", "Sunucu Hatası");
        break;
      case 502:
        _oneContextShowDialog("502", "Geçersiz Ağ Geçidi");
        break;
      default:
        _oneContextShowDialog("OOPS!", "Birşeyler Yanlış Gitti");
    }
    return super.onResponse(response, handler);
  }

/*-------------------OneContext().ShowDialog START-------------------------- */
  Future<dynamic> _oneContextShowDialog(String titlee, conttentTextt) {
    return OneContext().showDialog(
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(titlee),
        ),
        content: Text(conttentTextt),
        actions: [
          TextButton(
            onPressed: () {
              OneContext().popAllDialogs();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: Text(
                "TAMAM",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*-------------------OneContext().ShowDialog END-------------------------- */

/*-------------------SnackBarMethod START-------------------------- */
snackBarr(String title, message, BuildContext context) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      color: Colors.amber,
      title: title,
      message: message,
      contentType: ContentType.failure,
    ),
  );
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
/*-------------------SnackBarMethod END-------------------------- */
