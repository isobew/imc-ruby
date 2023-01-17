Projeto em Ruby on Rails de cálculo de IMC
 - Contém uma rota POST em API REST (/imc) que solicita os parâmetros de altura e largura em JSON
{
    "height": float,
    "weight": integer
}
e retorna o número do IMC, a classificação e o nível de obesidade em JSON
{
    "imc": float,
    "classification": string,
    "obesity": string
}
;
 - Contém a preparação de JWT sem rota de login. 

 Para rodar o projeto você precisará dos seguintes comandos:

 - bundle install
 - rails bd:migrate
 - rails server