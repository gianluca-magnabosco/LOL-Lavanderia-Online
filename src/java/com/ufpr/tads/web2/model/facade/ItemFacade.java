package com.ufpr.tads.web2.model.facade;

import java.util.ArrayList;
import com.ufpr.tads.web2.exception.DAOException;
import com.ufpr.tads.web2.model.dao.ItemDAO;
import com.ufpr.tads.web2.model.domain.Item;
import java.util.List;

public class ItemFacade {

private ItemDAO ItemDAO = new ItemDAO();

public List<Item> listItems() throws DAOException {
    return ItemDAO.listItems();
}

public void inserirItem(String nome, String preco, String tempo, String imagem) throws DAOException {
    Item item = new Item();
    item.setNome(request.getParameter("nome"));
    item.setPreco(Double.parseDouble(request.getParameter("preco")));
    item.setTempo(Integer.parseInt(request.getParameter("tempo")));
    item.setImagem(request.getParameter("imagem"));;
    ItemDAO.inserirItem(item);
}

public void atualizarItem(String id, String nome, String preco, String tempo, String imagem) throws DAOException {
    Item item = new Item();
    item.setId(Integer.parseInt(id));
    item.setNome(request.getParameter("nome"));
    item.setPreco(Double.parseDouble(request.getParameter("preco")));
    item.setTempo(Integer.parseInt(request.getParameter("tempo")));
    item.setImagem(request.getParameter("imagem"));;
    ItemDAO.atualizarItem(item);
}

public void deletarItem(String id) throws DAOException {
    ItemDAO.deletartem(Integer.parseInt(id));
}

}