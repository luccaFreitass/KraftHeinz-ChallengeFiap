<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.fiap.sprint.dao.ProdutoDao"%>
<%@ page import="br.com.fiap.sprint.model.Produto"%>
<%@ page import="br.com.fiap.sprint.dao.TicketDao"%>
<%@ page import="br.com.fiap.sprint.model.Ticket"%>

<%
long cod_produto = Long.parseLong(request.getParameter("cod_produto"));
ProdutoDao produtoDao = new ProdutoDao();
TicketDao ticketDao = new TicketDao();
Produto produto = produtoDao.recupera(cod_produto);
List<Ticket> tickets = ticketDao.recuperaPorProduto(cod_produto);
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/produto.css">

<title>Produto</title>
</head>
<body>
	<nav class="navbar bg-light fixed-top">
		<div
			class="container-fluid mx-5 d-flex flex-row align-items-center justify-content-between flex-nowrap">
			<a class="navbar-brand" href="#"> <img
				src="../images/kraftHeinzLogo.png" alt="Logo KraftHeinz" width="40%">
			</a>
			<ul
				class="navbar-nav d-flex flex-row align-items-center justify-content-between">
				<li class="nav-item"><a class="nav-link active fs-5"
					aria-current="page" href="./home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link active fs-5"
					href="./produtos.jsp">Produtos</a></li>
				<li class="nav-item"><a class="nav-link active fs-5"
					href="./tickets.jsp">Tickets</a></li>
				<li class="nav-item"><a class="nav-link active fs-5"
					href="./perguntas.jsp">Perguntas</a></li>
				<li class="nav-item">
    				<a class="nav-link active fs-5" href="./chatbot.jsp">Insights Generator</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="tamanho-nav"></div>

	<section class="container my-5">
		<div
			class="d-flex flex-column align-items-center justify-content-center p-5">
			<h1 class="text-center text-light fs-1 fw-light">Informações
				Gerais</h1>
		</div>
		<!-- Inicio card -->
		<!-- Aqui vc vai ter que pegar a informaÃ§Ã£o de qual produto o usuÃ¡rio clicou,
        e com base nisso pegar as informaÃ§Ãµes no banco         -->

		<!-- O que tem que ser mudado de acordo com a informaÃ§Ã£o puxada no banco eu vou colocar com
          um comentÃ¡rio na frente -->
		<div
			class="col d-flex flex-column align-items-center justify-content-center">
			<div class="card card-produto h-100">
				<a href="./produto.jsp?cod_produto=<%=produto.getCod_produto()%>">
					<div class="container box-img-card rounded-4">
						<img src="<%=produto.getImagem()%>" class="card-img-top" alt="...">
					</div>
				</a>
				<!--Imagem do produto-->
			</div>
			<div class="card-body d-flex flex-column align-items-center">
				<h5 class="card-title text-light">Avaliação geral</h5>
				<div class="d-flex justify-content-center align-items-center mt-2">
					<img src="../images/ESTRELAS-removebg-preview.png" alt=""
						width="60%">
					<!--Estrelas da media da avaliaÃ§Ã£o-->
					<p class="ps-3 m-0 text-light fs-4"><%=produto.getAvaliacao_geral() / 2%></p>
					<!--Nota da avaliaÃ§Ã£o mÃ©dia-->
				</div>
			</div>
		</div>
		</div>

		<!-- Fim card -->

	</section>

	<section
		class="container d-flex flex-column align-items-center justify-content-center mb-5">
		<div class="box-informacoes rounded-4 px-5">
			<div
				class="box-titles d-flex flex-column align-items-center justify-content-center">
				<h1 class="text-center text-light fs-1 fw-light">Tickets do
					Produto</h1>
			</div>

			<!-- Inicio card group -->



			<div
				class="d-flex flex-column justify-content-center align-items-center">
				<div
					class="row box-cards-ticket justify-content-center align-items-center p-5">

					<!-- Inicio card -->
					<%
					for (Ticket ticket : tickets) {
					%>

					<div class="col-sm-6 mb-3">
						<div class="card">
							<a class="text-decoration-none text-dark"
								href="./ticket.jsp?cod_ticket=<%=ticket.getCod_ticket()%>">
								<div class="card-body">
									<div class="container">
										<div class="row">


											<div class="col-4">
												<img src="../images/user.png" alt="" width="100%"
													class="rounded-circle">
												<div class="b ox-like d-flex align-items-end">
													<button class="btn-like" type="submit">
														<img src="../images/like.png" alt="" width="100%">
													</button>
													<button class="btn-like" type="submit">
														<img src="../images/dislike.png" alt="" width="100%">
													</button>
												</div>
											</div>
											<div class="col-8">
												<div
													class="box-title-card-ticket d-flex justify-content-center align-items-center p-1">
													<p class="m-0 text-center"><%=ticket.getConsumidor().getPrimeiro_nome()%>
														<%=ticket.getConsumidor().getSegundo_nome()%></p>
													<!--Nome de quem criou o ticket-->
												</div>

												<div class="my-2 ms-2">
													<img src="../images/ESTRELAS-removebg-preview.png" alt=""
														width="90vw">
												</div>

												<div class="text-end">
													<p><%=ticket.getComentario().length() > 50 ? ticket.getComentario().substring(0, 50) + "..."
		: ticket.getComentario()%></p>
													<!--ComentÃ¡rio que o consumidor fez no ticket-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</a>
						</div>
					</div>
					<%
					}
					%>
					<!-- Fim card -->

				</div>
			</div>

			<!-- Fim card group -->

			<div
				class="box-btn d-flex justify-content-center align-items-center mt-5">
				<a href="./tickets.jsp"><button type="submit"
						class="btn text-light fw-bold">Ver todos</button></a>
			</div>

			<div
				class="box-linha d-flex align-items-center justify-content-center">
				<img src="../images/linha.png" alt="" width="100%">
			</div>

			<div
				class="box-titles d-flex flex-column align-items-center justify-content-start">
				<h1 class="text-center text-light fs-1 fw-light">
					Resultado das Perguntas<br>deste Produto
				</h1>
			</div>

			<!-- Inicio Card Group -->
			<div
				class="d-flex flex-column justify-content-center align-items-center">
				<div class="row align-items-center justify-content-center">
					<!-- Inicio Card -->
					<div class="card p-0 m-3" style="width: 20rem;">
						<div class="card-body p-0 bg-card-body-perguntas text-center">
							<div
								class="card-num-pergunta d-flex justify-content-center align-items-center">
								<p class="m-0">Pergunta 1</p>
							</div>
							<div
								class="card-pergunta d-flex justify-content-center align-items-center">
								<p class="p-2 m-0 rounded-4">Você Gostou desse Produto ?</p>
							</div>
							<div class="d-flex align-items-center justify-content-center">
								<img src="../images/linha.png" alt="" width="100%">
							</div>
							<div
								class="quant-total d-flex flex-column align-items-center justify-content-center">
								<p>
									Quantidade Total <br> de Respostas:
								</p>
							</div>
							<div class="box-card-respostas">
								<div class="resposta-sim-nao rounded-4 mx-4 p-2">
									<div class="row">
										<div class="col-md-6">
											<p class="m-0">Sim: 80%</p>
										</div>
										<div class="col-md-6">
											<p class="m-0">Não: 20%</p>
										</div>
									</div>
								</div>

								<div class="respostas-total mx-4 my-3 rounded-4 p-2">
									<p class="m-0">Requests: 48</p>
								</div>
							</div>
						</div>
					</div>
					<!-- fim Card -->
				</div>
			</div>
			<div
				class="box-btn d-flex justify-content-center align-items-center my-5">
				<a href="./perguntas.jsp"><button type="submit"
						class="btn text-light fw-bold">Ver todos</button></a>
			</div>
		</div>
		<!-- Fim Card Group -->


	</section>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>
</html>