import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:telemedicina/app/modules/detail/view/detail.dart';

void main() {
  /**
   É um exemplo básico de teste de widget, ou seja, 
   um teste que renderiza partes da UI fora do app real, 
   para verificar se os widgets se comportam como esperado.
   */

  testWidgets('Exibe o texto de saudação', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));
    expect(find.text('Detalhes'), findsOneWidget);
  });

  testWidgets('Existe o icone', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));

    expect(find.byIcon(Icons.home), findsOneWidget);
  });

  testWidgets('Existe keyForm', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));

    expect(find.byType(Form), findsOneWidget);
  });

  /* 
  testWidgets('Não exibe mensagem de erro ao iniciar',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));
    expect(find.text('Erro'), findsNothing);
  });

  testWidgets('Renderiza pelo menos um ListTile', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));
    expect(find.byType(ListTile), findsWidgets);
  });

  testWidgets('Renderiza exatamente 5 Texts', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DetailPage()));
    expect(find.byType(Text), findsNWidgets(5));
  });
  */

  // Você usa os matchers acima combinados com um finder:
  /*
  | Finder                 | O que procura                 |
  | ---------------------- | ----------------------------- |
  | `find.text('texto')`   | Texto exato num widget `Text` |
  | `find.byType(Widget)`  | Por tipo de widget            |
  | `find.byKey(Key(...))` | Por chave única               |
  | `find.byIcon(Icons.*)` | Por ícone específico          |
  | `find.byWidget(...)`   | Por instância de widget       |
  | `find.descendant(...)` | Widget descendente de outro   |
  */

  /**
   🧪 Esse tipo de teste serve para quê?
      - Verificar se textos aparecem na tela.

      - Testar interações com botões.

      - Validar mudanças de estado visíveis na UI.

      - Testar múltiplos widgets sem subir o app completo.
   */
}
