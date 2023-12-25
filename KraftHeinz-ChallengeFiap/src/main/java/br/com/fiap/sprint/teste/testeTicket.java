package br.com.fiap.sprint.teste;

import java.util.Scanner;

import br.com.fiap.sprint.dao.TicketDao;
import br.com.fiap.sprint.model.Consumidor;
import br.com.fiap.sprint.model.Marca;
import br.com.fiap.sprint.model.Produto;
import br.com.fiap.sprint.model.Ticket;
import br.com.fiap.sprint.model.Tipo_ticket;

public class testeTicket {

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		String menu = "1- para inserir novo ticket \n" + "2- para alterar ticket \n" + "3- para deletar um ticket \n"
				+ "4- para consultar dados de um ticket \n" + "0- encerrar";
		int escolha;

		do {

			System.out.println(menu);
			escolha = in.nextInt();

			in.nextLine();

			switch (escolha) {
			case 1:

				System.out.println("Digite o id do consumidor: ");
				long idC = in.nextLong();
				System.out.println("Escolha a marca: \n" + "1- Heinz " + "2- Quero");
				int marca = in.nextInt();

				long idP = 0;

				Marca m = new Marca();

				m.setCod_marca(marca);

				switch (marca) {
				case 1:
					System.out.println("Escolha um produto para avaliar: \n" + "1- Ketchup Tradicional \n"
							+ "2- Ketchup Bacon e Cebola Caramelizada \n" + "3- Ketchup Jalapeño \n"
							+ "4- Ketchup Picante \n" + "5- Mostarda Yellow \n" + "6- Mostarda Honey \n"
							+ "7- Mostarda Hot \n" + "8- Maionese Tradicional \n" + "9- Maionese Chef \n"
							+ "10- Molho de Tomate Tradicional \n" + "11- Molho de Tomate Cogumelo \n"
							+ "12- Molho de Tomate Bolonhesa \n" + "13- Molho de Tomate Manjericao \n"
							+ "14- Molho de Tomate Arrabiata \n" + "15- Molho de Tomate Azeitona \n"
							+ "24- Mainose de gorgonzola \n" + "25- Mainose de paprica");
					idP = in.nextLong();

					break;

				case 2:

					System.out.println("Escolha um produto para avaliar \n" + "16- Ketchup Tradicional Quero \n"
							+ "17- Mostarda Amarela Quero \n" + "18- Molho 3 Em 1 Quero \n" + "19- Molho Shoyu Quero \n"
							+ "20- Ketchup Pizza Quero \n" + "21- Grão-De-Bico Em Conserva Quero \n"
							+ "22- Extratão De Tomate Quero \n" + "23- Milho Verde Em Conserva Quero");
					idP = in.nextLong();

					break;
				}

				System.out.println("Nota para o produto (1 a 10): ");
				Double avaliacao = in.nextDouble();

				System.out.println("Faça seu comentario: ");
				String comentario = in.next() + in.nextLine();

				Produto p = new Produto();
				p.setMarca(m);

				Ticket t = new Ticket();
				Consumidor c = new Consumidor();
				Tipo_ticket tp = new Tipo_ticket();
				tp.setCod_tipo_ticket(1);
				c.setCod_consumidor(idC);
				p.setCod_produto(idP);

				t.setConsumidor(c);
				t.setProduto(p);
				t.setAvaliacao(avaliacao);
				t.setComentario(comentario);
				t.setTipoTicket(tp);

				TicketDao dao = new TicketDao();
				try {
					dao.salva(t);
					dao.atualizaMedia(p.getCod_produto());
					System.out.println("ID Ticket: " + t.getCod_ticket());
					System.out.println("ID do consumidor: " + t.getConsumidor().getCod_consumidor());
					System.out.println("Ticket inserido");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("ID JA EXISTENTE");

				}
				break;

			case 2:

				System.out.println("Digite o id do ticket a ser alterado: ");
				long id2 = in.nextLong();
				System.out.println("Comentario: ");
				String comentario2 = in.next() + in.nextLine();
				System.out.println("Avaliacao: ");
				Double avaliacao2 = in.nextDouble();

				Ticket t2 = new Ticket();

				t2.setCod_ticket(id2);
				t2.setComentario(comentario2);
				t2.setAvaliacao(avaliacao2);

				TicketDao dao2 = new TicketDao();

				try {
					dao2.altera(t2);
					dao2.atualizaMedia(t2.getProduto().getCod_produto());
					System.out.println("Ticket alterado");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
				}

				break;

			case 3:

				System.out.println("Digite o id do ticket que desaja remover: ");
				long id = in.nextLong();

				TicketDao dao3 = new TicketDao();

				Ticket t3 = new Ticket();
				t3.setCod_ticket(id);

				try {
					dao3.deleta(id);
					System.out.println("Removido");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("NAO HA NINGUEM COM ESSE ID");
				}

				break;

			case 4:

				System.out.println("Digite o id do ticket que deseja consultar: ");
				long id4 = in.nextLong();

				TicketDao dao4 = new TicketDao();

				try {
					Ticket t4 = dao4.recupera(id4);
					System.out.println(t4.getConsumidor().getPrimeiro_nome() + " "
							+ t4.getConsumidor().getSegundo_nome() + "\n" + t4.getProduto().getNome() + "\n"
							+ t4.getComentario() + "\nAvaliacao: " + t4.getAvaliacao());

				} catch (Exception e) {
					e.printStackTrace();
				}
				break;

			}
		} while (escolha != 0);

		System.out.println("Programa Encerado");
		in.close();
	}

}
