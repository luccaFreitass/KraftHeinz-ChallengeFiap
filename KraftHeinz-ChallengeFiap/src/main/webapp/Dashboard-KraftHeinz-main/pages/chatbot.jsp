<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="br.com.fiap.sprint.dao.GptDao"%>
<%@ page import="java.io.*,java.util.*" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/chatbot.css">

    <title>Insights Generator</title>
</head>
<body>
    <nav class="navbar bg-light mb-5 fixed-top">
        <div class="container-fluid mx-5 d-flex flex-row align-items-center justify-content-between flex-nowrap">
          <a class="navbar-brand" href="#">
            <img src="../images/kraftHeinzLogo.png" alt="Logo KraftHeinz" width="40%">  
          </a>
          <ul class="navbar-nav d-flex flex-row align-items-center justify-content-between">
            <li class="nav-item">
              <a class="nav-link active fs-5" aria-current="page" href="./home.jsp">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active fs-5" href="./produtos.jsp">Produtos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active fs-5" href="./tickets.jsp">Tickets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active fs-5" href="./perguntas.jsp">Perguntas</a>
            </li>        
            <li class="nav-item">
              <a class="nav-link active fs-5" href="./chatbot.jsp">Insights Generator</a>
            </li>
          </ul>
        </div>
    </nav>
    <div class="tamanho-nav"></div>

    <section class="container my-5 d-flex align-items-center justify-content-center">
        <div class="box-chatbot rounded-4 p-5">

            <div class="box-btn d-flex justify-content-start align-items-center">
                <!-- Bot�o para atualizar os dados -->
                <button type="submit" class="btn text-light fw-bold">Atualizar Dados</button>
            </div>

            <div class="d-flex justify-content-end mt-5">
                <div class="box-comentario-adm rounded-4 py-2 px-4 d-flex justify-content-center text-end">
                    <!-- Pergunta/coment�rio que o adm envia -->
                    <p class="text-light">Lorem, ipsum dolor sit amet consectetur adipisicing elit. Tenetur, eaque.</p>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-3 d-flex align-items-start justify-content-end">
                    <img src="../images/icon chatbot.png" width="70%" alt="">
                </div>
                <div class="col-md-9">
                    <div class="box-resposta-chatbot rounded-4 py-2 px-4 d-flex justify-content-center">
                        <!-- Resposta do chatbot -->
                        <p class="text-light">Lorem ipsum dolor sit amet. Hic veniam corporis qui consequuntur laboriosam qui itaque voluptatem sed unde unde rem dicta odio sed quos eveniet. Ut sapiente enim sit dolorum amet et quibusdam earum? Sed omnis quia no </p>
                    </div>
                </div>
            </div>
         
            <div class="box-input-adm d-flex align-items-end justify-content-center">
    <div class="input-group">
        <input type="text" class="form-control" id="meuInput" placeholder="Digite...">
        <!-- Modificamos o evento de clique do bot�o para chamar a fun��o gpt() -->
        <button class="btn text-light" type="button" id="btnAdmChatbot" onclick="gpt()">Enviar</button>
    </div>
</div>
        </div>
        
    </section>
	
	<script>
    function gpt() {
        var resp = document.getElementById('meuInput').value;
        // Define a vari�vel 'respostaChatbot' para receber a resposta do Java
        var respostaChatbot = '<%= new br.com.fiap.sprint.dao.GptDao().chatGPT("oi") %>';
        console.log(respostaChatbot);
            }
</script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>    
</body>
</html>