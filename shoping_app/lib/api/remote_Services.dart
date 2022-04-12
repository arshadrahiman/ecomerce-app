// import 'dart:ffi';

// import 'package:shoping_cart/api/get.dart';
// import 'package:http/http.dart' as http;

// class Remote {
//   Future<GetData?> FetchData() async {
//     var client = http.Client();

//     var uri = Uri.parse(
//         'http://yellowstore.hexeam.org/api/store/extproduct/list?store_id=1');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       print(json);

//       return getDataFromJson(json);
//     }
//   }
// }
