# Gerenciamento de Produtos - Frontend

Aplicativo Flutter para gerenciamento de produtos, com operações CRUD completas.

## 🚀 Começando

Estas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste e avaliação do projeto.

### 📋 Pré-requisitos

* Flutter SDK instalado (versão 3.0 ou superior)
* Dart SDK instalado
* Backend do projeto rodando (https://github.com/daniel-pereira-silva/gerenciamento-de-produtos-backend)


### 🔧 Instalação e Execução Detalhada

1. **Primeiro, certifique-se que o backend está rodando**
   ```bash
   # Clone e execute o backend primeiro:
   git clone https://github.com/daniel-pereira-silva/gerenciamento-de-produtos-backend
   cd projeto-backend
   # Siga as instruções do README do backend
   ```

2. **Clone este repositório**
   ```bash
   git clone https://github.com/cDanx/front_mobile.git
   cd front_mobile
   ```

3. **Instale as dependências**
   ```bash
   flutter pub get
   ```

4. **Verifique a configuração do ambiente**
   ```bash
   flutter doctor
   ```

5. **Execute o aplicativo**
   ```bash
   # Para desenvolvimento
   flutter run
   ```

### 📋 Arquivos Ignorados no Git

O projeto ignora automaticamente:
* Arquivos de build e cache
* Configurações locais de IDE
* Arquivos de ambiente
* Dependências e plugins
* Arquivos temporários

Para começar um desenvolvimento limpo:
1. Clone o repositório
2. Execute `flutter pub get`
3. Configure seu ambiente local
4. Comece a desenvolver!

### ⚠️ Observações Importantes

* Certifique-se de que o backend está rodando antes de iniciar o frontend
* Para desenvolvimento em dispositivo Android físico, atualize o IP do backend em `lib/services/product_service.dart`
* Não commite arquivos de configuração local ou builds

### 📱 Usando o Aplicativo

* Na tela inicial, você verá a lista de produtos cadastrados
* Use o botão '+' para adicionar um novo produto
* Toque em um produto para ver seus detalhes
* Use os ícones de editar/excluir para modificar ou remover produtos

## 🛠️ Construído com

* [Flutter](https://flutter.dev/) - Framework UI
* [Dart](https://dart.dev/) - Linguagem de programação
* [http](https://pub.dev/packages/http) - Package para requisições HTTP

## 📦 Estrutura do Projeto

```
lib/
  ├── models/          # Classes de modelo
  ├── screens/         # Telas do aplicativo
  ├── services/        # Serviços e APIs
  ├── utils/          # Utilitários e helpers
  ├── widgets/        # Widgets reutilizáveis
  └── main.dart       # Ponto de entrada do aplicativo
```

## ⚙️ Funcionalidades

* Listagem de produtos
* Cadastro de novos produtos
* Visualização detalhada de produto
* Edição de produtos existentes
* Exclusão de produtos
* Validação de formulários

## 🔍 Endpoints da API

O frontend se comunica com os seguintes endpoints:

* `GET /` - Lista todos os produtos
* `POST /` - Cria um novo produto
* `PUT /:id` - Atualiza um produto existente
* `DELETE /:id` - Remove um produto

## ✒️ Autor Inicial

* **Daniel Emanuel Pereira da Silva** - *RA: a388839* - [Daniel](https://github.com/cDanx)

## 📱 Versão

* 1.0.0
    * Primeira versão funcional (06/11/2024) 