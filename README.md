# Avaliação Desenvolvedor Rails

## Pré-requisitos

* Ruby 2.1.10
* Rails 4.0.0

### Instalação

Clone esse projeto na sua máquina

```
cd avaliacao_desenvolvedor
```
Instalando as gems

```
bundle install
```

Crie o banco e rode as migrates

```
rake db:create db:migrate
```

Inicie o servidor

```
rails s
```

No seu navegador, acesse:

```
localhost:3000
```

### Realizando testes

Para testar o upload + parse de um arquivo no formato padrão, utilize o arquivo "dados.txt" que está na raiz do projeto


### Realizando testes automatizados

Para rodar os testes de model e controller, execute o comando a seguir no terminal, na raiz do projeto.

```
rake
```

Para realizar testes individuais, execute o comando a seguir

```
ruby -I test "CAMINHO PARA O ARQUIVO"
```

Exemplo:

```
ruby -I test test/controllers/purchases_controller.rb
```

