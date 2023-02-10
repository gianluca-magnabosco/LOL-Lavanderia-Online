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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.nio.file.Paths;
import org.apache.commons.io.IOUtils;


public class ItemFacade {

    
    public static List<Item> listAll() throws DAOException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            ItemDAO dao = new ItemDAO(factory.getConnection());
            return dao.searchAll();
        }
    }
    
    
    public static Item searchById(String id) throws DAOException, DadoInvalidoException {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            Validacao.validarInteiro(id, "O id de roupa inserido é inválido!");
            ItemDAO dao = new ItemDAO(factory.getConnection());
            return dao.searchById(Integer.parseInt(id));
        }
    }
    

    public static void insert(String nome, String preco, String tempo, Part imagem) throws DAOException, ArquivoInvalidoException, ErroInserindoArquivoException, DadoInvalidoException {
        
        validarParametros(nome, tempo);
        double precoUnitario = validarConverterPreco(preco);
        String imagemPath = validarArquivo(imagem);
        
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

    
    public static void update(String id, String nome, String preco, String tempo, Part imagem) throws DAOException, DadoInvalidoException, ArquivoInvalidoException, ErroInserindoArquivoException {
        
        Validacao.validarInteiro(id, "O id de roupa inserido é inválido!");
        validarParametros(nome, tempo);
        double precoUnitario = validarConverterPreco(preco);
        String imagemPath = validarArquivo(imagem);

        
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
            Validacao.validarInteiro(id, "O id de roupa inserido é inválido!");
            ItemDAO dao = new ItemDAO(factory.getConnection());
            dao.deleteById(Integer.parseInt(id));
        }
    }
    
    
    private static void validarParametros(String nome, String tempo) throws DadoInvalidoException {    
        Validacao.validarVazio(nome, "O nome é obrigatório!");
        Validacao.validarInteiro(tempo, "O tempo de lavagem inserido é inválido!");
    }
    
    
    private static double validarConverterPreco(String preco) throws DadoInvalidoException {
        return Validacao.validarConverterPreco(preco, "O preco inserido é inválido!");
    }
    
    
    private static String validarArquivo(Part imagem) throws ArquivoInvalidoException, ErroInserindoArquivoException {
        
        if (imagem == null) {
            throw new ArquivoInvalidoException("O arquivo inserido é inválido!");
        }
        
        String nomeDoArquivo = Paths.get(imagem.getSubmittedFileName()).getFileName().toString();
        
        if (!imagem.getContentType().startsWith("image/")) {
            throw new ArquivoInvalidoException("O arquivo deve ser uma imagem!");
        }

        String imagemPath = "images" + File.separator + nomeDoArquivo;

        try (InputStream input = imagem.getInputStream();
                OutputStream output = new FileOutputStream(imagemPath)) {
            
            IOUtils.copy(input, output);
            
        } catch (IOException e) {
            throw new ErroInserindoArquivoException("Erro ao inserir arquivo!");
        }
        
        return imagemPath;
    }

}