package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.exception.ArquivoInvalidoException;
import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.exception.DadoInvalidoException;
import com.ufpr.tads.web2.exception.ErroInserindoArquivoException;
import com.ufpr.tads.web2.model.dao.ConnectionFactory;
import com.ufpr.tads.web2.model.dao.ItemDAO;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.util.Validacao;
import jakarta.servlet.http.Part;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.nio.file.Paths;



public class ItemFacade {

    
    public static List<Item> listAll() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            ItemDAO dao = new ItemDAO(factory.getConnection());
            return dao.searchAll();
        }
    }
    
    
    public static Item searchById(String id) throws DAOException, DadoInvalidoException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Validacao.validarInteiro(id, "O id de roupa inserido eh invalido!");
            ItemDAO dao = new ItemDAO(factory.getConnection());
            return dao.searchById(Integer.parseInt(id));
        }
    }
    

    public static void insert(String nome, String preco, String tempo, Part imagem, String path) throws DAOException, ArquivoInvalidoException, ErroInserindoArquivoException, DadoInvalidoException {
        
        validarParametros(nome, tempo);
        String imagemPath = validarArquivo(imagem, path);
        double precoUnitario = validarConverterPreco(preco);
        tempo = tempo.replace(" dia(s)", "");
        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Item item = new Item();
            item.setNome(nome);
            item.setPreco(precoUnitario);
            item.setTempo(Integer.parseInt(tempo));
            item.setImagem(imagemPath);
            
            ItemDAO dao = new ItemDAO(factory.getConnection());
            dao.insert(item);
        }
    }

    
    public static void update(String id, String nome, String preco, String tempo, Part imagem, String path) throws DAOException, DadoInvalidoException, ArquivoInvalidoException, ErroInserindoArquivoException {
        
        Validacao.validarInteiro(id, "O id de roupa inserido eh invalido!");
        validarParametros(nome, tempo);
        String imagemPath = validarArquivo(imagem, path);
        double precoUnitario = validarConverterPreco(preco);
        tempo = tempo.replace(" dia(s)", "");

        
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Item item = new Item();
            item.setId(Integer.parseInt(id));
            item.setNome(nome);
            item.setPreco(precoUnitario);
            item.setTempo(Integer.parseInt(tempo));
            item.setImagem(imagemPath);
            
            ItemDAO dao = new ItemDAO(factory.getConnection());
            dao.update(item);
        }
    }
    
    public static void delete(String id) throws DAOException, DadoInvalidoException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Validacao.validarInteiro(id, "O id de roupa inserido eh invalido!");
            ItemDAO dao = new ItemDAO(factory.getConnection());
            dao.deleteById(Integer.parseInt(id));
        }
    }
    
    
    private static void validarParametros(String nome, String tempo) throws DadoInvalidoException {    
        Validacao.validarVazio(nome, "O nome eh obrigatorio!");
        
        if (!tempo.matches("\\d+\\sdia\\(s\\)")) {
            throw new DadoInvalidoException("O tempo de lavagem inserido eh invalido!");
        }

        tempo = tempo.replace(" dia(s)", "");

        Validacao.validarInteiro(tempo, "O tempo de lavagem inserido eh invalido!");
    }
    
    
    private static double validarConverterPreco(String preco) throws DadoInvalidoException {
        return Validacao.validarConverterPreco(preco, "O preco inserido é inválido!");
    }
    
    
    private static String validarArquivo(Part imagem, String path) throws ArquivoInvalidoException, ErroInserindoArquivoException {
        
        if (imagem == null) {
            throw new ArquivoInvalidoException("O arquivo inserido eh invalido!");
        }
        
        String nomeDoArquivo = Paths.get(imagem.getSubmittedFileName()).getFileName().toString();
        
        if (!imagem.getContentType().startsWith("image/")) {
            throw new ArquivoInvalidoException("O arquivo deve ser uma imagem!");
        }
  
        String imagemPath = path + File.separator + "images" + File.separator;
        
        File arquivoImagem = new File(imagemPath + nomeDoArquivo);
        if (arquivoImagem.exists()) {
            int i = 1;
            String extensao = nomeDoArquivo.substring(nomeDoArquivo.length() - 4);
            String novoNomeArquivo = new String();
            while (arquivoImagem.exists()) {
                novoNomeArquivo = nomeDoArquivo.substring(0, nomeDoArquivo.length() - 4) + i + extensao;
                arquivoImagem = new File(imagemPath + novoNomeArquivo);
                i++;
            }
            
            nomeDoArquivo = novoNomeArquivo;
        }
        
        try (BufferedInputStream input = new BufferedInputStream(imagem.getInputStream());
                BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(arquivoImagem))) {
            
            int read;
            while ((read = input.read()) != -1) {
                output.write(read);
            }
            
        } catch (IOException e) {
            e.printStackTrace();
            throw new ErroInserindoArquivoException("Erro ao inserir arquivo!");
        }
        
        return "images/" + nomeDoArquivo;
    }

}