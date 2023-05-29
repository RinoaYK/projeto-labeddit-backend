# Projeto Labeddit - backend
Esse é o último projeto do curso da Labenu de Fullstack e por isso foi utilizado todo o conhecimento adquirido em back-end e front-end.

A **API Labeddit** é parte do backend do **Projeto Labeddit Fullstack**, uma plataforma que busca proporcionar uma experiência semelhante ao **Reddit**.

Com a **API Labeddit**, você terá acesso a uma variedade de recursos, incluindo usuários, postagens, comentários e funcionalidades de curtidas e descurtidas.

A **API Labeddit** segue o conceito do **CRUD** (Create, Read, Update, Delete), permitindo que você crie, leia, atualize e exclua recursos relacionados a usuários, postagens e comentários. Essas funcionalidades são essenciais para uma interação completa e dinâmica, semelhante ao que você encontra no **Reddit**.

Para acessar os recursos protegidos, é necessário fornecer as credenciais de autenticação corretas nas solicitações. Para obter informações detalhadas sobre cada endpoint, incluindo os parâmetros necessários e as respostas esperadas, consulte a documentação completa abaixo.

A **API Labeddit** foi desenvolvida com as melhores práticas de programação e utiliza tecnologias modernas para garantir um desempenho otimizado e uma experiência de usuário agradável. A arquitetura do projeto foi projetada visando escalabilidade e manutenibilidade, proporcionando uma base sólida para o desenvolvimento futuro.

#  - Lidia Yamamura -

### Veja a documentação: 
[**API Labeddit documentação Postman**](https://documenter.getpostman.com/view/25826614/2s93m8zLhc): https://documenter.getpostman.com/view/25826614/2s93m8zLhc


[**API Labeddit deploy**](https://projeto-labeddit-backend-ust7.onrender.com):  https://projeto-labeddit-backend-ust7.onrender.com
<br>

### Projeto frontend Labeddit : 
[**Labeddit deploy**](https://labeddit-lidia-yamamura.surge.sh/): https://labeddit-lidia-yamamura.surge.sh/

[**Labeddit Github**](https://github.com/RinoaYK/projeto-labeddit-fullstack): https://github.com/RinoaYK/projeto-labeddit-fullstack
<br>

## **Tecnologias Utilizadas:**
- NodeJS
- Typescript
- Express
- SQL e SQLite
- Knex
- POO
- Arquitetura em camadas
- Geração de UUID
- Geração de hashes
- Autenticação e autorização
- Roteamento
- Postman
- Jest

## Banco de dados:
![projeto-Labeddit]('')

# **API Labeddit**
- Documentação [**Postman**](https://documenter.getpostman.com/view/25826614/2s93m8zLhc) com todos os endpoints;
- **Endpoints:**
    - **Users:**
        - Signup
            - Cadastra uma nova pessoa.
        - Login
            - Efetua o login de uma pessoa cadastrada.
        - Get Users        
            - Retorna todas as pessoas cadastradas.
            - Pode ser enviado uma query, q fará uma busca do parâmetro no email do usuário, retornando as informações do usuário.
        - Edit User
            - Edita um usuário cadastrado.
           
    - **Posts:**    
        - Create Post
            - Adiciona um post.
        - Get Posts
            - Retorna todos os posts.
        - Get Posts By User Nickname
            - Retorna todos os posts de um determinado usuário.
        - Edit Post
            - Edita um post.
        - Delete Post
            - Deleta um post.
            - Só quem criou o post pode deletá-lo.
            - **Admins podem deletar o post de qualquer pessoa.**
        - Like / Dislike Post.
            - Quem criou o post não pode dar like ou dislike no mesmo.
            - Caso dê um like em um post que já tenha dado like, o like é desfeito.
            - Caso dê um dislike em um post que já tenha dado dislike, o dislike é desfeito.
            - Caso dê um like em um post que tenha dado dislike, o like sobrescreve o dislike.
            - Caso dê um dislike em um post que tenha dado like, o dislike sobrescreve o like.
        - Get Posts Likes Dislikes
            - Retorna a tabela de likes e deslike da relação de user com post.
   - **Comments:**    
        - Create Comment
            - Adiciona um comment.
        - Get Comments
            - Retorna todos os comments.
        - Get Comments By Post
            - Retorna todos os comentários de um post.
        - Get Comments By User Nickname
            - Retorna todos os comments de um determinado usuário.
        - Edit Comment
            - Edita um comment.
        - Delete Comment
            - Deleta um comment.
            - Só quem criou o comment pode deletá-lo.
            - **Admins podem deletar o post de qualquer pessoa.**
        - Like / Dislike Comment
            - Quem criou o comment não pode dar like ou dislike no mesmo.
            - Caso dê um like em um comment que já tenha dado like, o like é desfeito.
            - Caso dê um dislike em um comment que já tenha dado dislike, o dislike é desfeito.
            - Caso dê um like em um comment que tenha dado dislike, o like sobrescreve o dislike.
            - Caso dê um dislike em um comment que tenha dado like, o dislike sobrescreve o like.
        - Get Comments Likes Dislikes
            - Retorna a tabela de likes e deslike da relação de user com comment.

- **Autenticação e autorização:**
    - Identificação UUID
    - Senhas hasheadas com Bcrypt
    - Tokens JWT
 
 - **Código**
    - POO
    - Arquitetura em camadas
    - Roteadores no Express
- **Erros e testes**
    - Jest Coverage

## **Instalação:**

Para instalar a [**API Labeddit**](https://documenter.getpostman.com/view/25826614/2s93m8zLhc), você precisará seguir os seguintes passos:

- Certifique-se de que o Node.js e o gerenciador de pacotes NPM estejam instalados em seu sistema.
- Baixe ou clone o repositório do projeto em sua máquina.

- Abra o terminal no diretório do projeto e execute o comando npm install para instalar todas as dependências necessárias.
- Crie e configure a database com o SQLServer. Siga o caminho em .env.example.
- Em seguida, execute o comando npm run start para iniciar o servidor localmente. Ou execute o comando npm run dev para iniciar o servidor da API em modo de desenvolvimento.
```bash
# Instale todas as dependências
$ npm install

# iniciar o servidor localmente
npm run start
# modo de desenvolvimento
$ npm run dev

# A aplicação será iniciada na porta 3003

# Use algum API Client para realizar as requisições

# Para realizar a verificação dos testes em  Jest, execute o comando:
$ npm run test -- --collect-coverage
```

- Agora você pode acessar a API usando o endpoint http://localhost:3000/ ou pelo endpoint da [**API Labeddit deploy**](https://projeto-labeddit-backend-ust7.onrender.com):  https://projeto-labeddit-backend-ust7.onrender.com
- Para obter informações mais detalhadas sobre como usar os endpoints, consulte a documentação da [**API Labeddit**](https://documenter.getpostman.com/view/25826614/2s93m8zLhc).
-  Sinta-se à vontade para explorar a documentação da [**API Labeddit**](https://documenter.getpostman.com/view/25826614/2s93m8zLhc) e experimentar todas as funcionalidades disponíveis. Aproveite a experiência completa do [**Labeddit Fullstack**](https://labeddit-lidia-yamamura.surge.sh/) com a API!

