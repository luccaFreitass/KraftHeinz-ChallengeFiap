
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.fiap.sprint.dao.TicketDao"%>
<%@ page import="br.com.fiap.sprint.model.Ticket"%>
<%@ page import="br.com.fiap.sprint.dao.ProdutoDao"%>
<%@ page import="br.com.fiap.sprint.model.Produto"%>

<%
ProdutoDao produtoDao = new ProdutoDao();
List<Produto> produtos = produtoDao.recuperaTodosProdrutos();

// Limitando para os primeiros 10 produtos
int limiteProduto = 9;
int contadorProduto = 0;
%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/home.css">

</head>

<body>

	<nav class="navbar bg-light mb-5 fixed-top">
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

	<section class="container rounded-4 my-5">
		<div
			class="box-powerbi d-flex aligh justify-content-center align-items-center">
			<iframe title="Report Section" width="90%" height="90%"
				src="https://app.powerbi.com/view?r=eyJrIjoiZGVkZTUzZDQtMWIyNy00MzY1LWIzZmEtM2VjOWIxODFlMmZmIiwidCI6IjExZGJiZmUyLTg5YjgtNDU0OS1iZTEwLWNlYzM2NGU1OTU1MSIsImMiOjR9"
				frameborder="0" allowFullScreen="true"></iframe>
		</div>
	</section>

	<section
		class="container tamanho-section-primary bg-section-primary rounded-4 my-5 px-5">

		<!-- Início seção produtos -->
<div class="d-flex justify-content-center align-items-center box-produtos text-light">
    <h2 class="fs-1 fw-light">Produtos</h2>
</div>

<div class="box-pricipais-produtos d-flex flex-column align-items-center justify-content-center">

    <div class="box-cards d-flex flex-column justify-content-center p-5">
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <!-- Inicio card -->
            <!-- Esse card embaixo é a base dos outros, então só duplicar ele -->
            <!-- Essa parte mostra os principais produtos, os que foram mais bem avaliados -->
            <!-- Eu inventei para ficar bonito no vídeo, se for fazer com conexão no banco tem que fazer a comparação das avaliações -->

            <!-- O que tem que ser mudado de acordo com a informação puxada no banco eu vou colocar com um comentário na frente -->
            <%
            for (Produto produto : produtos) {
                if (contadorProduto >= limiteProduto) {
                    break; // Sai do loop se já exibiu 10 produtos
                }
                contadorProduto++;
            %>
            <div class="col">
                <a href="./produto.jsp?cod_produto=<%=produto.getCod_produto()%>" class="text-decoration-none">
                    <div class="card h-100">
                        <img src="<%=produto.getImagem()%>" class="card-img-top" alt="...">
                        <!-- Esse aqui é a imagem do produto -->
                        <div class="card-body d-flex flex-column align-items-center">
                            <h5 class="card-title">Avaliação</h5>
                            <img src="../images/ESTRELAS-removebg-preview.png" alt="" width="50%">
                            <!-- Esse aqui é as estrelas mostrando a avaliação média do produto -->
                        </div>
                    </div>
                </a>
            </div>
            <%
            }
            %>
            <!-- Fim card -->

        </div>
    </div>

</div>

<div class="box-btn d-flex justify-content-center align-items-center mt-5">
    <a href="./produtos.jsp"><button type="submit" class="btn text-light fw-bold">Ver todos produtos</button></a>
</div>

<div class="box-linha d-flex align-items-center justify-content-center">
    <img src="../images/linha.png" alt="" width="100%">
</div>
<!-- Fim seção produtos -->
		<!-- InÃ­cio seÃ§Ã£o Tickets -->


		<div
			class="d-flex justify-content-center align-items-center box-produtos text-light ">
			<h2 class="fs-1 fw-light">Tickets</h2>
		</div>



		<!-- Inicio card group -->


		<!-- Inicio card -->


		<%
TicketDao ticketDao = new TicketDao();
List<Ticket> tickets = ticketDao.recuperaTodosOsTickets();

// Limitando para os primeiros 6 tickets
int limite = 6;
int contador = 0;
%>

		<!-- Seção onde os tickets serão exibidos -->
		<section
			class="container d-flex flex-column align-items-center justify-content-center mb-5">
			<div class="box-informacoes rounded-4 px-5">

				<!-- Inicio card group -->
				<div
					class="d-flex flex-column justify-content-center align-items-center">
					<div
						class="row box-cards-ticket justify-content-center align-items-center p-5">
						<!-- Inicio card -->
						<%
						for (Ticket ticket : tickets) {
							if (contador >= limite) {
								break; // Sai do loop se já exibiu 6 tickets
							}
							contador++;
						%>
						<div class="col-sm-6 mb-3">
							<div class="card">
								<a class="text-decoration-none text-dark"
									href="./ticket.jsp?cod_ticket=<%=ticket.getCod_ticket()%>">
									<div class="card-body">
										<div class="container">
											<div class="row">
												<div class="col-4">
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
													<div
														class="box-title-card-ticket d-flex justify-content-center align-items-center p-1">
														<p class="m-0 text-center"><%=ticket.getConsumidor().getPrimeiro_nome()%>
															<%=ticket.getConsumidor().getSegundo_nome()%></p>
													</div>
													<div class="my-2 ms-2">
														<img src="../images/ESTRELAS-removebg-preview.png" alt=""
															width="90vw">
													</div>
													<div class="text-end">
														<p><%=ticket.getComentario().length() > 100 ? ticket.getComentario().substring(0, 100) + "..."
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
						<!-- Fim card -->
					</div>
				</div>
				<!-- Fim card group -->

				<div
					class="box-btn d-flex justify-content-center align-items-center mt-5">
					<a href="./tickets.jsp"><button type="submit"
							class="btn text-light fw-bold">Ver todos</button></a>
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