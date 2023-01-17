Projeto em Ruby on Rails de cálculo de IMC
 - Contém uma rota POST em API REST (/imc) que solicita os parâmetros de altura e largura e retorna o número do IMC, a classificação e o nível de obesidade;
 - Contém a preparação de JWT sem rota de login. 

 Para rodar o projeto você precisará dos seguintes comandos:

 - bundle install
 - rake bd:migrate
 - rails server