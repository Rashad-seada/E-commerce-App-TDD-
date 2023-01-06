import 'package:dartz/dartz.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:evira/domain/repository/auth_repository.dart';
import 'package:evira/domain/usecases/login_natively.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock
    implements AuthRepository {
}

void main(){
  late LoginNatively usecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = LoginNatively(mockLoginRepository);
  });

  const tEmail = 'example@gmail.com';
  const tPassword = '8291917Mn';

  final user = User(
    id: 1,
    firstName: 'Rashad',
    lastName: 'Seada',
    email: tEmail,
    emailVerifiedAt: '0',
    createdAt: '0',
    updatedAt: '0',
  );

  final loginEntity = LoginEntity(
    statusCode: 200,
    message: "you have been logged in successfully",
    user: user,
    token: "32|H0rZ8eEFQnkTMWIbLEtiajqEqq2xUu1AtwxscqU",
  );

  test(
      'should get login request response from the repository',
      () async {
      //arrange
      when(mockLoginRepository.loginNatively(tEmail,tPassword))
          .thenAnswer((realInvocation) async => Right(loginEntity));
      //act
      final result = await usecase(LoginParams(email: tEmail, password: tPassword));
      //assert
      expect(result, Right(loginEntity));
      });
}