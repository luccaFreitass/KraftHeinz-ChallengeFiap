package br.com.fiap.sprint.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class GptDao {

	
	public String chatGPT(String message) {
		String url = "https://api.openai.com/v1/chat/completions";
		String apiKey = "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"; // API key goes here
		String model = "gpt-3.5-turbo"; // current model of chatgpt api

		try {
			// Create the HTTP POST request
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "Bearer " + apiKey);
			con.setRequestProperty("Content-Type", "application/json");

			// Build the request body
			String body = "{\"model\": \"" + model + "\", \"messages\": [{\"role\": \"user\", \"content\": \"" + message
					+ "\"}]}";
			con.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
			writer.write(body);
			writer.flush();
			writer.close();

			// Get the response
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				//System.out.println(inputLine);
				response.append(inputLine);
			}

			in.close();

			//System.out.println(stringCerta(response.toString()));

			// returns the extracted contents of the response.
			return stringCerta(response.toString());

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public String stringCerta(String jsonString) {
		// Encontre o índice de "content"
		int startIndex = jsonString.indexOf("content");
		//System.out.println(startIndex);

		int endIndex = jsonString.indexOf("finish_reason");
		//System.out.println(endIndex);

		String content = jsonString.substring(startIndex + 11, endIndex-11);
		//System.out.println("Conteúdo: " + content);
		
		return content;
	}
	
}

