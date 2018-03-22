# Teste ZUP - API para auxiliar as pessoas na localização de pontos de acesso.

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
    * HEADERS:
    ```
    Content-Type: application/json
    ```


### Examplos de chamadas a API
* Serviço para cadastrar pontos de interesse, com 3 atributos: Nome do POI, coordenada X
(inteiro não negativo) e coordenada Y (inteiro não negativo)
  * POST http://localhost:3000/api/v1/points_of_interest.json

  ATRIBUTOS:
  - Nome do POI: 'name'
  - Coordenada X: 'x'
  - Coordenada Y: 'y'

  EXAMPLE BODY:
  ```
  {
    "name": "Padaria", "x": "8", "y": "8"
  }
  ```

  * Serviço para listar todos os POIs cadastrados.
    * GET http://localhost:3000/api/v1/points_of_interest.json

    EXAMPLE RESPONSE BODY:
    ```
    [
      {
        "id": 1,
        "name": "Padaria",
        "x": 8,
        "y": 8,
        "created_at": "2018-03-22T21:25:16.435Z",
        "updated_at": "2018-03-22T21:25:16.435Z"
      }
    }
    ```

  * Serviço para listar POIs por proximidade. Este serviço receberá uma coordenada X
  e uma coordenada Y, especificando um ponto de referência, bem como uma distância
  máxima (d-max) em metros. O serviço deverá retornar todos os POIs da base de dados
  que estejam a uma distância menor ou igual a d-max a partir do ponto de referência.
    * GET http://localhost:3000/api/v1/points_of_interest.json

    ATRIBUTOS:
    - Coordenada X: 'x'
    - Coordenada Y: 'y'
    - Distância máxima: 'd_max'

    EXAMPLE QUERY PARAMETERS:
    ```
    {
      "x": 8,
      "y": 8,
      "d_max": 2
    }
    ```

    EXAMPLE RESPONSE BODY:
    ```
    [
      {
        "id": 1,
        "name": "Padaria",
        "x": 8,
        "y": 8,
        "created_at": "2018-03-22T21:25:16.435Z",
        "updated_at": "2018-03-22T21:25:16.435Z"
      }
    ]
    ```
