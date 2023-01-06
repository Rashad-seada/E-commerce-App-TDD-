import 'package:dartz/dartz.dart';
import 'package:evira/core/error/faliure.dart';
import 'package:evira/domain/entities/login_entity.dart';
import 'package:evira/domain/entities/reset_password_entity.dart';
import 'package:evira/domain/repository/auth_repository.dart';
import 'package:evira/domain/usecases/login_natively.dart';
import 'package:evira/domain/usecases/reset_my_password.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockLoginRepository extends Mock
    implements AuthRepository {
}

void main(){
  late ResetPassword usecase;
  late MockLoginRepository mockLoginRepository;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = ResetPassword(mockLoginRepository);
  });

  const tEmail = 'example@gmail.com';
  const tPhoneNumber = '01050687752';

  ResetPasswordEntity resetPasswordEntity = ResetPasswordEntity(
    statusCode: 200,
    message: "the code has been sent successfully"
  );

  test(
      'should get login request response from the repository',
          () async {
        //arrange
        when(mockLoginRepository.resetMyPassword(tEmail))
            .thenAnswer((realInvocation) async => Right(resetPasswordEntity));
        //act
        final result = await usecase(ResetPasswordParams(emailOrPassword: tEmail)) as ResetPasswordParams;
        //assert
        expect(result, Right(resetPasswordEntity));
      });
}