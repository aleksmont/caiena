# Aleksander Ruby Api Test

Aplicação consiste em uma unica rota GET recebendo o nome de uma cidade, com este parametro é feita a busca pelo clima e em seguida feito um tweet com essa info.

Procedimentos para rodar a api:

* preencher as chaves no arquivo local_env.yml

* Rodar os tests de integração weather_controller_test.rb

* Utilizar qualquer método possivel para realizar a requisição: http://0.0.0.0:3000/weather/index?city=nome_da_cidade

Gems utilizadas:
* openweathermap
* twitter