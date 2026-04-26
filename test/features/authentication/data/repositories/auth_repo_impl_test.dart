/*

UNIT TESTING STEPS IN THE MAIN FUNCTION
1. ARRANGE
    1. Create and get all dependencies and variables needed for the test
    

2. ACT
3. ASSERT




 */

/*

LOGIN
Register
LOGOUT
GET USER DATA
FORGET PASSWORD
VERTIFY RESET PASSWORD


UseCases: 
1. success  return =>  SuccessBaseResponse<String>(String data)
2. error    return =>  ErrorBaseResponse<String>(String errorMessage)
3. empty fields

Dependencies:
1. authRemoteDataSourceContract
2. authLocalDataSourceContract


*/

import 'package:e_commerce/config/base_response/base_response.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_local_data_source_contract.dart';
import 'package:e_commerce/features/authentication/data/datasources/auth_remote_data_source_contract.dart';
import 'package:e_commerce/features/authentication/data/models/user_model.dart';
import 'package:e_commerce/features/authentication/data/repositories/auth_repo_impl.dart';
import 'package:e_commerce/features/authentication/domain/entities/user_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'auth_repo_impl_test.mocks.dart';

// the dependecies mocks
@GenerateMocks([AuthRemoteDataSourceContract, AuthLocalDataSourceContract])
void main() {
  // ARRANGE
  late MockAuthLocalDataSourceContract mockAuthLocalDataSourceContract;
  late MockAuthRemoteDataSourceContract mockAuthRemoteDataSourceContract;
  late AuthRepoImpl authRepoImpl;

  late String email;
  late String password;
  late String userName;
  late String firstName;
  late String lastName;
  late String otp;

  late String emptyEmail;
  late String emptyPassword;
  late String emptyFirstName;
  late String emptyLastName;
  late String emptyotp;

  setUpAll(() {
    mockAuthLocalDataSourceContract = MockAuthLocalDataSourceContract();
    mockAuthRemoteDataSourceContract = MockAuthRemoteDataSourceContract();
    authRepoImpl = AuthRepoImpl(
      authRemoteDataSourceContract: mockAuthRemoteDataSourceContract,
      authLocalDataSourceContract: mockAuthLocalDataSourceContract,
    );

    email = "ziad.sleem.111@gmail.com";
    password = "Password!68446871";
    userName = "Ziad";
    firstName = "Ziad";
    lastName = "Sleem";
    otp = '123456';

    emptyEmail = "";
    emptyPassword = "";
    emptyFirstName = "";
    emptyLastName = "";
    emptyotp = "";

    // provide dummy data for the base response
    provideDummy<BaseResponse<String>>(SuccessBaseResponse<String>("data"));
    provideDummy<BaseResponse<String>>(ErrorBaseResponse<String>("error"));
    provideDummy<BaseResponse<UserModel>>(
      SuccessBaseResponse<UserModel>(
        UserModel(username: userName, email: email),
      ),
    );
    provideDummy<BaseResponse<UserEntity>>(
      SuccessBaseResponse<UserEntity>(
        UserEntity(username: userName, email: email),
      ),
    );
  });

  // ACT
  // auth group
  group('auth repo impl', () {
    group('login', () {
      // first usecase
      test(
        'Return SuccessBaseResponse<String> when login is successful',
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.login(
              email: email,
              password: password,
            ),
          ).thenAnswer((_) async => SuccessBaseResponse<String>("data"));

          // ACT
          final result = await authRepoImpl.login(
            email: email,
            password: password,
          );

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<String>>());
          // expect that the data is correct
          expect((result as SuccessBaseResponse<String>).data, "data");
        },
      );

      test("Return ErrorBaseResponse<String> when login fails", () async {
        // ARRANGE
        when(
          authRepoImpl.login(email: email, password: password),
        ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

        // ACT
        final result = await authRepoImpl.login(
          email: email,
          password: password,
        );

        // ASSERT
        expect(result, isA<ErrorBaseResponse<String>>());
        expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
      });

      test("Return ErrorBaseResponse<String> when fields are empty", () async {
        // ARRANGE
        when(
          authRepoImpl.login(email: emptyEmail, password: emptyPassword),
        ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

        // ACT
        final result = await authRepoImpl.login(
          email: emptyEmail,
          password: emptyPassword,
        );

        // ASSERT
        expect(result, isA<ErrorBaseResponse<String>>());
        expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
      });
    });

    group("Register", () {
      test(
        'Return SuccessBaseResponse<String> when register is successful',
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.register(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
            ),
          ).thenAnswer((_) async => SuccessBaseResponse<String>("data"));

          // ACT
          final result = await authRepoImpl.register(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
          );

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<String>>());
          // expect that the data is correct
          expect((result as SuccessBaseResponse<String>).data, "data");
        },
      );

      test("Return ErrorBaseResponse<String> when register fails", () async {
        // ARRANGE
        when(
          authRepoImpl.register(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
          ),
        ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

        // ACT
        final result = await authRepoImpl.register(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );

        // ASSERT
        expect(result, isA<ErrorBaseResponse<String>>());
        expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
      });

      test("Return ErrorBaseResponse<String> when fields are empty", () async {
        // ARRANGE
        when(
          authRepoImpl.register(
            firstName: emptyFirstName,
            lastName: emptyLastName,
            email: emptyEmail,
            password: emptyPassword,
          ),
        ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

        // ACT
        final result = await authRepoImpl.register(
          firstName: emptyFirstName,
          lastName: emptyLastName,
          email: emptyEmail,
          password: emptyPassword,
        );

        // ASSERT
        expect(result, isA<ErrorBaseResponse<String>>());
        expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
      });
    });

    group("Logout", () {
      test(
        "Return SuccessBaseResponse<void> when logout is successful",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.logout(),
          ).thenAnswer((_) async => null);

          // ACT
          final result = await authRepoImpl.logout();

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<void>>());
        },
      );

      test("Return ErrorBaseResponse<void> when logout fails", () async {
        // ARRANGE
        when(
          mockAuthRemoteDataSourceContract.logout(),
        ).thenThrow(Exception('error'));

        // ACT
        final result = await authRepoImpl.logout();

        // ASSERT
        expect(result, isA<ErrorBaseResponse<void>>());
        expect((result as ErrorBaseResponse<void>).errorMessage, isNotNull);
      });
    });

    group("Get User Data", () {
      test(
        "Return SuccessBaseResponse<UserModel> when get user data is successful",
        () async {
          // ARRANGE
          when(mockAuthRemoteDataSourceContract.getUserData()).thenAnswer(
            (_) async => SuccessBaseResponse<UserModel>(
              UserModel(username: userName, email: email),
            ),
          );

          // ACT
          final result = await authRepoImpl.getUserData();

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<UserEntity>>());
          // expect that the data is correct
          final successResult = result as SuccessBaseResponse<UserEntity>;
          expect(successResult.data.username, userName);
          expect(successResult.data.email, email);
        },
      );

      test(
        "Return ErrorBaseResponse<UserModel> when get user data fails",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.getUserData(),
          ).thenAnswer((_) async => ErrorBaseResponse<UserModel>('error'));

          // ACT
          final result = await authRepoImpl.getUserData();

          // ASSERT
          expect(result, isA<ErrorBaseResponse<UserEntity>>());
          expect(
            (result as ErrorBaseResponse<UserEntity>).errorMessage,
            'error',
          );
        },
      );
    });

    group("Forget Password", () {
      test(
        "Return SuccessBaseResponse<String> when forget password is successful",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.forgetPassword(email),
          ).thenAnswer((_) async => SuccessBaseResponse<String>("data"));

          // ACT
          final result = await authRepoImpl.forgetPassword(email);

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<String>>());
          // expect that the data is correct
          expect((result as SuccessBaseResponse<String>).data, "data");
        },
      );

      test(
        "Return ErrorBaseResponse<String> when forget password fails",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.forgetPassword(email),
          ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

          // ACT
          final result = await authRepoImpl.forgetPassword(email);

          // ASSERT
          expect(result, isA<ErrorBaseResponse<String>>());
          expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
        },
      );
    });

    group('Verify Reset Code', () {
      test(
        "Return SuccessBaseResponse<String> when verify reset code is successful",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.verifyResetCode(email, otp),
          ).thenAnswer((_) async => SuccessBaseResponse<String>("data"));

          // ACT
          final result = await authRepoImpl.verifyCode(email: email, otp: otp);

          // ASSERT
          // expect that it's success
          expect(result, isA<SuccessBaseResponse<String>>());
          // expect that the data is correct
          expect((result as SuccessBaseResponse<String>).data, "data");
        },
      );

      test(
        "Return ErrorBaseResponse<String> when verify reset code fails",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.verifyResetCode(email, otp),
          ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

          // ACT
          final result = await authRepoImpl.verifyCode(email: email, otp: otp);

          // ASSERT
          expect(result, isA<ErrorBaseResponse<String>>());
          expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
        },
      );

      test(
        "Return ErrorBaseResponse<String> when verify reset code is empty",
        () async {
          // ARRANGE
          when(
            mockAuthRemoteDataSourceContract.verifyResetCode(
              emptyEmail,
              emptyotp,
            ),
          ).thenAnswer((_) async => ErrorBaseResponse<String>('error'));

          // ACT
          final result = await authRepoImpl.verifyCode(
            email: emptyEmail,
            otp: emptyotp,
          );

          // ASSERT
          expect(result, isA<ErrorBaseResponse<String>>());
          expect((result as ErrorBaseResponse<String>).errorMessage, 'error');
        },
      );
    });
  });
}
