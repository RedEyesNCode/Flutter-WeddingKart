// import 'package:chopper/chopper.dart';
//
// part 'user_service.chopper.dart';
//
// @ChopperApi(baseUrl: '/spring-wedding')
// abstract class UserService extends ChopperService {
//   static UserService create() {
//     final client = ChopperClient(
//       baseUrl: 'http://localhost:3577',
//       services: [
//         _$UserService(),
//       ],
//       converter: JsonConverter(),
//     );
//
//     return _$UserService(client);
//   }
//
//
//   @Post(path: '/login-user')
//   Future<Response> registerUser(@Body() Map<String, dynamic> userData);
// }
