# Pilar Mobile Test

Este projeto é um exemplo de aplicação móvel desenvolvida em Flutter, utilizando diversas tecnologias modernas e boas práticas de desenvolvimento de software. Abaixo, você encontrará uma descrição detalhada das principais tecnologias usadas, as rotas implementadas e um passo-a-passo de como inicializar o projeto.

## Tecnologias Usadas

- **Flutter**: Foi escolhido o Flutter como framework de desenvolvimento.
- **FlutterBloc**: Gerenciamento de estado utilizando o padrão Bloc (Business Logic Component).
- **Lottie**: Biblioteca para animações em JSON.
- **Melos**: Ferramenta para gerenciar projetos Flutter em monorepos.
- **Makefile**: Arquivo de script para automatizar tarefas de build e testes.
- **i18n**: Internacionalização para suporte a múltiplos idiomas.
- **Dio**: Cliente HTTP para Dart, utilizado para realizar requisições à API.
- **get_it**: Injetor de dependência simples e eficiente.
- **Equatable**: Comparação de objetos para evitar a reimplementação de `==` e `hashCode`.
- **go_router**: Gerenciador de rotas para navegação dentro da aplicação.

## Rotas Implementadas

- **Home Screen**: Tela inicial que exibe uma lista de filmes em destaque.
- **Movie Detail Screen**: Tela de detalhes de um filme específico, acessível a partir da Home Screen.

## Inicializando o Projeto

### Pré-requisitos

- Flutter instalado na máquina. Você pode seguir as instruções no site oficial do Flutter para instalar o SDK: [Instalação do Flutter](https://flutter.dev/docs/get-started/install)
- Flutter doctor:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.3, on macOS 14.2.1 23C71 darwin-arm64, locale en-BR)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.2)
[✓] Xcode - develop for iOS and macOS (Xcode 15.4)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2022.2)
[✓] VS Code (version 1.91.1)
[✓] Connected device (7 available)
[✓] Network resources

• No issues found!
```
- `git clone https://github.com/Mobile-Tests/pilar.git`
- Instale o melos: `make flutter-activate-melos`
- Instale as dependências: `make`
- Rodar o projeto: `cd app && flutter run`
- Testar: `make test-all`

### TODOs:
- Busca.
- Testes unitários, testes de widgets e e2e.