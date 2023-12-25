<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.fiap.sprint.dao.TicketDao"%>
<%@ page import="br.com.fiap.sprint.model.Ticket"%>

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
<link rel="stylesheet" href="../css/tickets.css">

<title>Tickets</title>
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

	<section class="container-fluid p-0">
		<div
			class="box-title d-flex align-items-center justify-content-center">
			<h1 class="text-light fw-light text-center rounded-5 p-4">Todos
				os Tickets</h1>
		</div>

		<div
			class="box-filtros d-flex justify-content-start align-items-center p-3">
			<div class="modal fade" id="modalOrdenar" aria-hidden="true"
				tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div
						class="modal-content d-flex flex-column align-items-center justify-content-center">
						<div
							class="box-modal-title d-flex align-items-center justify-content-center my-4">
							<p class="text-light fs-4 px-4 py-2 m-0 rounded-4">Ordenar
								por:</p>
						</div>
						<div
							class="box-modal-radiobtn d-flex flex-column align-items-center justify-content-center rounded-3 mb-5">
							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Melhor avaliação </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio" id="melhorAval">
									</div>
								</div>
							</div>

							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Pior avaliação </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio" id="piorAval">
									</div>
								</div>
							</div>

							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Maior quantidade de
											likes </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio"
											id="maiorQuantLikes">
									</div>
								</div>
							</div>

							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Menor quantidade de
											likes </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio"
											id="menorQuantLikes">
									</div>
								</div>
							</div>

							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Maior quantidade de
											dislikes </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio"
											id="maiorQuantDisikes">
									</div>
								</div>
							</div>

							<div class="form-check-reverse">
								<div class="row py-1">
									<div class="col-md-10 d-flex align-items-start">
										<label class="form-check-label"> Menor quantidade de
											dislikes </label>
									</div>
									<div class="col-md-2 d-flex align-items-end">
										<input class="form-check-input" type="radio"
											id="menorQuantDisikes">
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<button class="btn btn-primary rounded-4 ms-5"
				data-bs-target="#modalOrdenar" data-bs-toggle="modal">Ordenar</button>

			<div class="modal fade" id="modalFiltrar" aria-hidden="true"
				tabindex="-1">
				<div class="modal-dialog modal-dialog-centered">
					<div
						class="modal-content d-flex flex-column align-items-center justify-content-center pb-5">
						<div
							class="box-modal-title d-flex align-items-center justify-content-center my-4">
							<p class="text-light fs-4 px-4 py-2 m-0 rounded-4">Filtrar
								Por:</p>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>Produto</option>
								<option selected>Produtos</option>
								<option value="1">Ketchup Tradicional</option>
								<option value="2">Ketchup Bacon e Cebola Caramelizada</option>
								<option value="3">Ketchup Jalapeño</option>
								<option value="4">Ketchup Picante</option>
								<option value="5">Mostarda Yellow</option>
								<option value="6">Mostarda Honey</option>
								<option value="7">Mostarda Hot</option>
								<option value="8">Maionese Tradicional</option>
								<option value="9">Maionese Chef</option>
								<option value="10">Molho de Tomate Tradicional</option>
								<option value="11">Molho de Tomate Cogumelo</option>
								<option value="12">Molho de Tomate Bolonhesa</option>
								<option value="13">Molho de Tomate Manjericao</option>
								<option value="14">Molho de Tomate Arrabiata</option>
								<option value="15">Molho de Tomate Azeitona</option>
								<option value="16">Molho Barbecue</option>
								<option value="17">Mostarda Amarela Quero</option>
								<option value="18">Molho 3 Em 1 Quero</option>
								<option value="19">Molho Shoyu Quero</option>
								<option value="20">Ketchup Pizza Quero</option>
								<option value="21">Grão-De-Bico Em Conserva Quero</option>
								<option value="22">Extratão De Tomate Quero</option>
								<option value="23">Milho Verde Em Conserva Quero</option>
								<option value="24">Maionese de gorgonzola</option>
								<option value="25">Maionese de Paprica</option>
								<option value="26">Molho de tomate Quero</option>
								<option value="27">Ketchup Tradicional Quero</option>
							</select>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>Consumidor</option>
								<option value="1">Luis Nascimento</option>
								<option value="2">Fernanda Martins</option>
								<option value="3">Ricardo Oliveira</option>
								<option value="4">Amanda Ribeiro</option>
								<option value="5">Leonardo Sousa</option>
								<option value="6">Carolina Fernandes</option>
							</select>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>Nota</option>
								<option value="1">Um</option>
								<option value="2">Dois</option>
								<option value="3">Três</option>
								<option value="4">Quatro</option>
								<option value="5">Cinco</option>
							</select>
						</div>

						<div
							class="box-modal-title d-flex align-items-center justify-content-center my-4">
							<p class="text-light fs-4 px-4 py-2 m-0 rounded-4">Região:</p>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>País</option>
								<option value="1">Brasil</option>

							</select>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>Estado</option>
								<option value="1">SP</option>
								<option value="2">GO</option>
								<option value="3">MG</option>
								<option value="4">BA</option>
								<option value="4">RJ</option>
							</select>
						</div>

						<div class="box-modal-select my-2">
							<select class="form-select select-style text-light">
								<option selected>Cidade</option>
								<option value="1">São Paulo</option>
								<option value="2">Goiania</option>
								<option value="3">Belo Horizonte</option>
								<option value="4">Salvador</option>
								<option value="5">Rio de Janeiro</option>
							</select>
						</div>

						<div
							class="box-btn d-flex justify-content-center align-items-center mt-5">
							<a href="./tickets.jsp"><button type="submit"
									class="btn text-light fw-bold">Filtrar</button></a>
						</div>

					</div>

				</div>
			</div>
			<button class="btn btn-primary rounded-4 ms-5"
				data-bs-target="#modalFiltrar" data-bs-toggle="modal">Filtrar</button>

		</div>
	</section>



	<section
		class="container d-flex align-items-center justify-content-center">

		<div
			class="row box-cards-ticket justify-content-center align-items-center p-5 mt-5">

			<!-- Inicio loop para exibir todos os tickets -->

			<%
			TicketDao ticketDao = new TicketDao();
			List<Ticket> tickets = ticketDao.recuperaTodosOsTickets();
			%>
			<%
			for (Ticket ticket : tickets) {
			%>

			<div class="col-sm-6 mb-4">
				<div class="card">
					<a class="text-decoration-none text-dark"
						href="./ticket.jsp?cod_ticket=<%=ticket.getCod_ticket()%>">
						<div class="card-body">
							<div class="container">
								<div class="row">
									<!-- Adicione aqui o código para exibir as informações do ticket -->
									<div class="col-4">
										<!-- Exemplo: Imagem do consumidor -->
										<img src="../images/userRed.png" alt="" width="100%"
											class="rounded-circle">
										<div class="box-like d-flex align-items-end">
											<button class="btn-like" type="submit">
												<img src="../images/like.png" alt="" width="100%">
											</button>
											<button class="btn-like" type="submit">
												<img src="../images/dislike.png" alt="" width="100%">
											</button>
										</div>
									</div>
									<div class="col-8">
										<!-- Nome do consumidor -->
										<div
											class="box-title-card-ticket d-flex justify-content-center align-items-center p-1">
											<p class="m-0 text-center"><%=ticket.getConsumidor().getPrimeiro_nome() + " " + ticket.getConsumidor().getSegundo_nome()%></p>
										</div>

										<!--Estrelas -->
										<div class="my-2 ms-2">
											<img src="../images/ESTRELAS-removebg-preview.png" alt=""
												width="90vw">
										</div>

										<!--Comentário -->
										<div class="text-end">
											<p><%=ticket.getComentario().length() > 200 ? ticket.getComentario().substring(0, 200) + "..."
		: ticket.getComentario()%></p>
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
			<!-- Fim loop -->

		</div>
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