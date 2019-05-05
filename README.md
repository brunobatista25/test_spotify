# Test_Spotify

Uma api do Spotify para criar playlist de musicas entre outras coisas.

Foi usado para os testes da api:

```
Ruby - Linguagem de programação.

Httparty - Gem com os comandos para testes de api.

Rspec - Gem para estruturar o projeto e rodar os testes e asserções.

Faker - Gem para geração de dados aleatórios.

Rubocop - Gem para verificação estática do código.
```

## Conta

Login do usuário para pegar o token:
```
email: brunobatista@mailinator.com
senha: 123456
````

O id do meu usuário é: 
```
2ivrc43hzntxfl1wuxy9kvm0l
```

Como a api não libera login para poder pegar o token, gere o token no site, copie e coloque no seguinte arquivo:
```
user_sevice.rb 
````
(Lá já tem um token mas como ele expira basta alterar esse token e por o que foi gerado no site.)

# Cenários:

Foi feito alguns testes são esses:

Buscar perfil com sucesso pelo id.

Buscar perfil com sucesso pelo user atual.

Buscar perfil semsucesso com id errado.

Criar playlist com sucesso.

Criar playlist sem campos obrigatórios.

Criar playlist com id do usuário errado.

Criar playlist colaborativa naão privada.

Criar playlist com outro usuário.

Listar playlists.

Ver detalhes de uma playlist.

Adicionar um track na playlist.

Remover um track de uma playlist.

# Rodar o projeto

Baixe o projeto

```
git clone https://github.com/brunobatista25/test_spotify
```

Acesse a pasta e instale as dependêcias:

```
cd test_spotify
```

```
bundle install
```

Rode o comando

```
bundle exec rspec
```

# Rodando com Docker

Acesse a pasta e instale as dependêcias:

```
cd test_spotify
```

Crie uma imagem

```
docker build -t <nome_da_imagem> .
```
(Este comando cria imagem atráves do arquivo dokerfile dentro do projeto).

Rodar a imagem

```
docker run --rm <image_name> bundle exec rspec
```