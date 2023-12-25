<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="br.com.fiap.sprint.dao.TicketDao"%>
<%@ page import="br.com.fiap.sprint.model.Ticket"%>

<%
long cod_ticket = Long.parseLong(request.getParameter("cod_ticket"));
TicketDao ticketDao = new TicketDao();
Ticket ticket = ticketDao.recupera(cod_ticket);
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
<link rel="stylesheet" href="../css/ticket.css">

<title>Ticket</title>
</head>
<body>
    <nav class="navbar bg-light mb-5 fixed-top">
        <div class="container-fluid mx-5 d-flex flex-row align-items-center justify-content-between flex-nowrap">
            <a class="navbar-brand" href="#"> <img src="../images/kraftHeinzLogo.png" alt="Logo KraftHeinz" width="40%"> </a>
            <ul class="navbar-nav d-flex flex-row align-items-center justify-content-between">
                <li class="nav-item"><a class="nav-link active fs-5" aria-current="page" href="./home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link active fs-5" href="./produtos.jsp">Produtos</a></li>
                <li class="nav-item"><a class="nav-link active fs-5" href="./tickets.jsp">Tickets</a></li>
                <li class="nav-item"><a class="nav-link active fs-5" href="./perguntas.jsp">Perguntas</a></li>
                <li class="nav-item"><a class="nav-link active fs-5" href="./chatbot.jsp">Insights Generator</a></li>
            </ul>
        </div>
    </nav>

    <div class="tamanho-nav"></div>

    <section class="container-fluid d-flex align-items-center justify-content-center">
        <div class="box-card-ticket d-flex align-items-center justify-content-center">
            <div class="card">
                <div class="card-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-4 d-flex align-items-center justify-content-center">
                                <img src="../images/userRed.png" alt="" width="100%" class="rounded-circle">
                            </div>
                            <div class="col-8">
                                <div class="box-title-card-ticket d-flex justify-content-center align-items-center p-1">
                                    <p class="m-0 text-center"><%= ticket.getConsumidor().getPrimeiro_nome() %> <%= ticket.getConsumidor().getSegundo_nome() %></p>
                                </div>

                                <div class="my-2 ms-2">
                                    <img src="../images/ESTRELAS-removebg-preview.png" alt="" width="100vw">
                                </div>

                                <div class="d-flex justify-content-end">
                                    <div class="box-descricao text-end">
                                        <p><%=ticket.getComentario().length() > 200 ? ticket.getComentario().substring(0, 200) + "..."
		: ticket.getComentario()%></p>
                                    </div>
                                </div>

                                <div class="box-like d-flex justify-content-end">
                                    <button class="btn-like" type="submit">
                                        <img src="../images/like.png" alt="" width="100%">
                                    </button>
                                    <button class="btn-like" type="submit">
                                        <img src="../images/dislike.png" alt="" width="100%">
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<section class="container">
		<div
			class="box-section-info d-flex flex-column align-items-center justify-content-center py-5 rounded-4 mb-5">
			<div
				class="box-avaliacao-media rounded-4 d-flex flex-column align-items-center justify-content-center mb-4">
				<div class="box-title-avaliacao-media">
					<p class="fs-3">Avaliacao Média</p>
				</div>
				<div class="d-flex justify-content-center align-items-center my-2">
					<img src="../images/ESTRELAS-removebg-preview.png" width="80%">
				</div>
				<div class="box-informaÃ§Ã£o mt-3">
					<div class="box-quant-aval">
						<div class="row">
							<div class="col-9">
								<p class="fs-5">Quantidade de Avaliações:</p>
							</div>
							<div class="col-3 text-center">
								<p class="fs-5">53</p>
							</div>
						</div>
					</div>

					<div class="box-tipo-ticket">
						<div class="row">
							<div class="col-9">
								<p class="fs-5">Tipo do Ticket</p>
							</div>
							<div class="col-3">
								<p class="fs-5"><%= ticket.getTipoTicket().getNome() %></p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="box-info">
				<div class="row">
					<div class="col-7">
						<div class="box-criador p-5 rounded-4 text-center p-4">
							<div class="title-info">
								<p class="fs-4">Criador</p>
							</div>
							<div class="text-info">
								<p class="m-0">Nome: <%= ticket.getConsumidor().getPrimeiro_nome() + " " + ticket.getConsumidor().getSegundo_nome() %></p>
								<p class="m-0">Email: <%= ticket.getConsumidor().getEmail() %></p>
								<p class="m-0">Telefone: <%= ticket.getConsumidor().getTelefone() %></p>
							</div>
						</div>
					</div>
					<div class="col-5">
						<div class="box-regiao p-5 rounded-4 text-center p-4">
							<div class="title-info">
								<p class="fs-4">Região</p>
							</div>
							<div class="text-info">
								<p class="m-0">País: <%= ticket.getConsumidor().getPais() %></p>
								<p class="m-0">Estado: <%= ticket.getConsumidor().getEstado() %></p>
								<p class="m-0">Cidade: <%= ticket.getConsumidor().getCidade() %></p>
								<p class="m-0">Bairro: <%= ticket.getConsumidor().getBairro() %></p>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="box-comentario">
				<p class="fs-4 text-light">Comentário:</p>
				<div class="text-area-comentario p-5 rounded-4">
					<p><%= ticket.getComentario() %></p>
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