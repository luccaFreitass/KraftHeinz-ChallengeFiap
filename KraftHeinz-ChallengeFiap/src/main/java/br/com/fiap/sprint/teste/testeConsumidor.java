package br.com.fiap.sprint.teste;

import java.util.Scanner;

import br.com.fiap.sprint.dao.ConsumidorDao;
import br.com.fiap.sprint.model.Consumidor;

public class testeConsumidor {

	public static void main(String[] args) {

		Scanner in = new Scanner(System.in);
		String menu = "1- para inserir novo cliente \n" + "2- para alterar dados de um cliente \n"
				+ "3- para deletar um cliente \n" + "4- para consultar dados de um cliente \n" + "0- encerrar";
		int escolha;

		do {

			System.out.println(menu);
			escolha = in.nextInt();
			
			in.nextLine();

			switch (escolha) {
			case 1:

				System.out.println("Digite o Primeiro Nome: ");
				String p_nome = in.next() + in.nextLine();
				System.out.println("Digite o Segundo Nome: ");
				String s_nome = in.next();
				System.out.println("Digite o Email: ");
				String email = in.next();
				System.out.println("Digite o telefone: ");
				String telefone = in.next();
				System.out.println("Digite o Pais: ");
				String pais = in.next() + in.nextLine();
				System.out.println("Digite o Estado: ");
				String estado = in.next() + in.nextLine();
				System.out.println("Digite a Cidade: ");
				String cidade = in.next() + in.nextLine();
				System.out.println("Digite o Bairro: ");
				String bairo = in.next() + in.nextLine();

				Consumidor c = new Consumidor();

				c.setPrimeiro_nome(p_nome);
				c.setSegundo_nome(s_nome);
				c.setEmail(email);
				c.setTelefone(telefone);
				c.setPais(pais);
				c.setEstado(estado);
				c.setCidade(cidade);
				c.setBairro(bairo);

				ConsumidorDao dao = new ConsumidorDao();

				try {
					dao.salva(c);
					System.out.println("ID do Consumidor: " + c.getCod_consumidor()); 
					System.out.println(c.getPrimeiro_nome() + " " + c.getSegundo_nome() + " inserido");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("ID JA EXISTENTE");

				}

				break;

			case 2:

				System.out.println("Digite o id do cliente a ser alterado: ");
				long id2 = in.nextLong();
				System.out.println("Digite o Primeiro Nome: ");
				String p_nome2 = in.next() + in.nextLine();
				System.out.println("Digite o Segundo Nome: ");
				String s_nome2 = in.next();
				System.out.println("Digite o Email: ");
				String email2 = in.next();
				System.out.println("Digite o telefone: ");
				String telefone2 = in.next();
				System.out.println("Digite o Pais: ");
				String pais2 = in.next() + in.nextLine();
				System.out.println("Digite o Estado: ");
				String estado2 = in.next() + in.nextLine();
				System.out.println("Digite a Cidade: ");
				String cidade2 = in.next() + in.nextLine();
				System.out.println("Digite o Bairro: ");
				String bairo2 = in.next() + in.nextLine();

				Consumidor c2 = new Consumidor();

				c2.setCod_consumidor(id2);
				c2.setPrimeiro_nome(p_nome2);
				c2.setSegundo_nome(s_nome2);
				c2.setEmail(email2);
				c2.setTelefone(telefone2);
				c2.setPais(pais2);
				c2.setEstado(estado2);
				c2.setCidade(cidade2);
				c2.setBairro(bairo2);

				ConsumidorDao dao2 = new ConsumidorDao();

				try {
					dao2.altera(c2);
					System.out.println(c2.getPrimeiro_nome() + " " + c2.getSegundo_nome() + " alterado");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
				}

				break;
			case 3:

				System.out.println("Digite o id do cliente que desaja remover: ");
				long id3 = in.nextLong();

				ConsumidorDao dao3 = new ConsumidorDao();

				try {
					dao3.deleta(id3);
					System.out.println("Removido");
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("NAO HA NINGUEM COM ESSE ID");
				}

				break;
			case 4:

				ConsumidorDao dao4 = new ConsumidorDao();

				System.out.println("Digite o id do cliente que desaja consultar:  ");
				long id4 = in.nextLong();

				try {
					Consumidor c4 = dao4.recupera(id4);
					System.out.println("Nome: " + c4.getPrimeiro_nome() + " " + c4.getSegundo_nome());
					System.out.println(c4.getEmail());
					System.out.println(c4.getTelefone());
					System.out
							.println(c4.getPais() + " " + c4.getEstado() + " " + c4.getCidade() + " " + c4.getBairro());
					System.out.println("---------------------");

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("NAO HA NINGUEM COM ESSE ID");
				}

				break;
			}

		} while (escolha != 0);

		System.out.println("Programa encerrado");
		in.close();

	}
}
