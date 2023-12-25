
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><!DOCTYPE html>
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
<link rel="stylesheet" href="../css/perguntas.css">

<title>Perguntas</title>
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

	<section class="container">
		<div
			class="box-title d-flex flex-column align-items-center justify-content-center">
			<h1 class="text-light">Perguntas Gerais</h1>
		</div>

		<div class="modal fade" id="modalTicket" aria-hidden="true"
			tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div
					class="modal-content d-flex flex-column align-items-center justify-content-center">
					<div class="d-flex align-items-center justify-content-center my-4">
						<p class="text-light fs-4 px-4 py-2 m-0 rounded-4">Pergunta
							Selecionada</p>
					</div>

					<div
						class="modal-pergunta-info p-5 text-center text-light rounded-4">
						<div class="modal-pergunta text-center rounded-4 p-2 px-5">
							<p class="text-light m-0 fs-5">Você gostou desse produto?</p>
						</div>
						<div
							class="modal-quant-resp d-flex align-items-center justify-content-center">
							<p class="m-0">
								1500 pessoas <br> responderam
							</p>
						</div>
						<div class="modal-info d-flex justify-content-between">
							<p>
								1200 pessoas = 80% <br> Responderam SIM
							</p>
							<p>
								300 pessoas = 20% <br> Responderam NÃƒO
							</p>
						</div>
					</div>

					<div
						class="box-linha d-flex align-items-center justify-content-center">
						<img src="../images/linha.png" alt="" width="100%">
					</div>

					<div class="modal-btns">
						<div
							class="box-btn d-flex justify-content-center align-items-center">
							<button type="submit" class="btn btn-modal text-light fw-bold">Editar</button>
						</div>

						<div
							class="box-btn d-flex justify-content-center align-items-center mt-3 mb-5">
							<button type="submit" class="btn text-light fw-bold">Excluir</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row">

			<!-- Inicio Pergunta -->

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<!-- Fim Pergunta -->

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a class="text-decoration-none" href=""
					data-bs-target="#modalTicket" data-bs-toggle="modal">
					<div class="box-pergunta rounded-4 p-3 text-center text-light mb-4">
						<p>Você gostou desse produto?</p>
						<div class="row">
							<div class="col-md-6">
								<p class="m-0">Sim: 80%</p>
							</div>
							<div class="col-md-6">
								<p class="m-0">Não: 20%</p>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>

		<div
			class="box-btn d-flex justify-content-center align-items-center my-5">
			<button type="submit" class="btn text-light fw-bold">Adicionar
				Pergunta</button>
		</div>

	</section>

	<div class="box-linha d-flex align-items-center justify-content-center">
		<img src="../images/linha.png" alt="" width="73%">
	</div>

	<section class="container d-flex flex-column align-items-center">
		<div
			class="box-title d-flex flex-column align-items-center justify-content-center">
			<h1 class="text-light">Perguntas Específicas</h1>
		</div>

		<div class="box-section-produto rounded-4 p-5 mb-5">
			<div class="box-perguntas-espec">
				<select class="form-select select-style text-light ps-5">
					<option selected>Selecione um Produto</option>
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

			<div
				class="perguntas-prod d-flex flex-column align-items-center justify-content-center">

				<p class="fs-3 text-light p-5">Tomato Ketchup - Heinz</p>

				<div class="col-md-12">
					<a class="text-decoration-none" href=""
						data-bs-target="#modalTicket" data-bs-toggle="modal">
						<div
							class="d-flex flex-column align-items-center justify-content-center">
							<div
								class="box-pergunta-prod rounded-4 p-3 text-center text-light mb-4">
								<p>Você gostou desse produto?</p>
								<div class="row">
									<div class="col-md-6">
										<p class="m-0">Sim: 80%</p>
									</div>
									<div class="col-md-6">
										<p class="m-0">Não: 20%</p>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-12">
					<a class="text-decoration-none" href=""
						data-bs-target="#modalTicket" data-bs-toggle="modal">
						<div
							class="d-flex flex-column align-items-center justify-content-center">
							<div
								class="box-pergunta-prod rounded-4 p-3 text-center text-light mb-4">
								<p>VocÃª gostou desse produto?</p>
								<div class="row">
									<div class="col-md-6">
										<p class="m-0">Sim: 80%</p>
									</div>
									<div class="col-md-6">
										<p class="m-0">Não: 20%</p>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-12">
					<a class="text-decoration-none" href=""
						data-bs-target="#modalTicket" data-bs-toggle="modal">
						<div
							class="d-flex flex-column align-items-center justify-content-center">
							<div
								class="box-pergunta-prod rounded-4 p-3 text-center text-light mb-4">
								<p>VocÃª gostou desse produto?</p>
								<div class="row">
									<div class="col-md-6">
										<p class="m-0">Sim: 80%</p>
									</div>
									<div class="col-md-6">
										<p class="m-0">Não: 20%</p>
									</div>
								</div>
							</div>
						</div>
					</a>
				</div>

			</div>
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