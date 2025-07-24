import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_test.dart';
import 'user_repository_test.mocks.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  /* 
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
  });

  test('deve retornar o nome do usuário', () async {
    // Arrange
    when(mockUserRepository.getUserName(1)).thenAnswer((_) async => 'Italo');

    // Act
    final name = await mockUserRepository.getUserName(1);

    // Assert
    expect(name, 'Italo');
    verify(mockUserRepository.getUserName(1)).called(1);
  });
  */
}

// Rodar no terminal:
// flutter pub run build_runner build