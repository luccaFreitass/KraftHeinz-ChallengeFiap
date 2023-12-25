
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.fiap.sprint.dao.ProdutoDao"%>
<%@ page import="br.com.fiap.sprint.model.Produto"%>

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
<link rel="stylesheet" href="../css/produtos.css">

<title>Produtos</title>
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
		<div class="box-hero pb-5">

			<div
				class="container-title d-flex align-items-center justify-content-center">
				<div
					class="box-title d-flex align-items-center justify-content-center">
					<h1 class="text-light">Produtos</h1>
				</div>
			</div>

			<div
				class="box-arrow d-flex flex-column align-items-center justify-content-end">
				<p class="m-0">SCROLL DOWN</p>
				<a href="#catalogoProdutos">
					<div class="hero-arrow-scroll"></div>
				</a>
			</div>
		</div>
	</section>

	<section
		class="container h-filtros d-flex align-items-end justify-content-between p-0"
		id="catalogoProdutos">
		<select class="form-select select-style text-light m-2"
			id="marcaSelect">

			<option selected value="0">Marcas</option>

			<option value="1">Heinz</option>
			<option value="2">Quero</option>


		</select> <select class="form-select select-style text-light m-2">

			<!-- NÃ£o sei se dÃ¡, mas seria muito maneiro colocar os prosutos nesses options -->
			<!-- Tenta puxar todas os produtos do banco e colocar os nome nesses options -->

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

		<div class="input-group input-group-sm m-2">
			<input type="text" class="form-control form-control-sm"
				placeholder="Digite um produto">
			<button class="btn btn-outline-secondary text-light" type="button"
				id="button-addon2">Buscar</button>
		</div>
	</section>

	<section
		class="container container-produtos-style d-flex justify-content-center align-items-center p-5 my-5 rounded-4">
		<!-- Inicio card group -->

		<div
			class="d-flex flex-column justify-content-center align-items-center">
			<div class="row row-cols-1 row-cols-md-3 g-4">

				<%
				ProdutoDao produtoDao = new ProdutoDao();
				List<Produto> produtos = produtoDao.recuperaTodosProdrutos();
				%>

				<!-- Início do loop para exibir todos os produtos -->
				<%
				for (Produto produto : produtos) {
				%>
				<div class="col produto-card"
					data-marca="<%=produto.getMarca().getCod_marca()%>">
					<div class="card h-100">
						<a href="./produto.jsp?cod_produto=<%=produto.getCod_produto()%>">
							<div class="container box-img-card rounded-4">
								<img src="<%=produto.getImagem()%>" class="card-img-top"
									alt="...">
							</div>
						</a>
						<div class="card-body d-flex flex-column align-items-center">
							<h5 class="card-title text-light">Avaliação</h5>
							<img src="../images/ESTRELAS-removebg-preview.png" alt=""
								width="60%">
						</div>
					</div>
				</div>
				<%
				}
				%>
				<!-- Fim do loop -->

			</div>
		</div>

		</div>
		</div>
		<!-- Fim card group -->
	</section>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>

	<script>
		document.getElementById('marcaSelect').addEventListener('change',
				function() {
					var marcaSelecionada = this.value;
					filtrarProdutosPorMarca(marcaSelecionada);
				});

		function filtrarProdutosPorMarca(marcaSelecionada) {
			var produtos = document.querySelectorAll('.produto-card');

			produtos.forEach(function(produto) {
				var marcaDoProduto = produto.dataset.marca;

				if (marcaSelecionada === '0') {
					produto.style.display = 'block';
				} else if (marcaSelecionada === marcaDoProduto) {
					produto.style.display = 'block';
				} else {
					produto.style.display = 'none';
				}
			});
		}
	</script>

</body>
</html>