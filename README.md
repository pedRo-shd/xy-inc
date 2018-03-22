# Test ZUP - API para auxiliar as pessoas na localização de pontos de acesso.

## Getting Started

Dependências:
* Rails: 5.1.5

* Ruby: 2.4.2

Para começar a usar este projeto, siga as informações abaixo:
* Clone o repositório: `git clone https://github.com/pedRo-shd/xy-inc.git`

* Rode os comandos:
  ```
  bundle install
  rails db:create db:migrate
  ```

Para rodar os testes em rspec com o guard:
* Rode o comando abaixo e clique em enter:
  ```
  bundle exec guard
  ```

Para rodar os testes apenas com rspec:
* Rode:
  ```
  rspec
  ```

Para testar a API, suba o projeto:
* Rode:
  ```
  rails s
  ```

## REST

Este projeto suporta API RESTful:
* Permite apenas solicitações nos formatos JSON
    * http://localhost:3000/api/v1/points_of_interest.json

### Examplos de chamadas a API
* Serviço para cadastrar pontos de interesse, com 3 atributos: Nome do POI, coordenada X
(inteiro não negativo) e coordenada Y (inteiro não negativo)
  * http://localhost:3000/api/v1/points_of_interest.json

  ATRIBUTOS:
  - Nome do POI: 'name'
  - Coordenada X: 'x'
  - Coordenada Y: 'y'

  BODY:
  ```
  {"point_of_interest":{
    "name": "Padaria", "x": "10", "y": "10"
    }
  }
  ```
