<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/login.css">

    <title>Login</title>
</head>
<body>
    <nav class="navbar pt-5 pb-4">
       <div class="container">
         <a class="navbar-brand" href="#">
           <img src="./images/kraftHeinzLogo.png" alt="Logo KraftHeinz" width="40%">
         </a>
       </div>
    </nav>

    <section>
        <div class="container-sm rounded-4 d-flex flex-column align-items-center justify-content-center">
            <div class="mb-5">
                <h1 class="fs-3 text-center text-light fw-light">Seja Bem-Vindo!<br>Entre com Usu�rio e Senha</h1>
            </div>
            
            <!-- Inicio - Formulário de login -->
            <form class="box-form pt-4">
                <div class="container-inputs">
                    <div class="mb-4">
                        <input type="email" class="form-control text-center text-light" id="email" placeholder="Email">
                    </div>
                    <div class="mb-3">
                        <input type="password" class="form-control text-center text-light" id="password" placeholder="Senha">
                    </div>
                    <div class="d-flex justify-content-end">
                        <a class="text-decoration-none text-light" href="">Esqueci minha senha</a>
                    </div>
                </div>        
            </form>
            <!-- Fim - Formulário de login -->

            <!-- O botão esta fora do FORM pois dentro ele não redireciona para a tela que o link manda -->
            <!-- Se for fazer autenticação tem que colocar ele dentro do FORM e tiara o link que coloquei -->
            <div class="d-flex justify-content-center align-items-center mt-4">
                <a href="./pages/home.jsp"><button type="submit" class="btn text-light fw-bold">Login</button></a>
            </div>
        </div>
    </section>
    


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</body>
</html>