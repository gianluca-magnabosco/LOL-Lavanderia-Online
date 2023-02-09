package com.ufpr.tads.web2.model.facade;

import java.util.ArrayList;
import java.util.List;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.dao.ItemDAO;

public class ItemFacade {
    private ItemDAO itemDAO = new ItemDAO();

    public List<Item> listarItems() {
        return itemDAO.listarItems();
    }

    public void inserirItem(Item Item) {
        itemDAO.inserirItem(Item);
    }

    public void atualizarItem(Item Item) {
        itemDAO.atualizarItem(Item);
    }

    public void deletarItem(int id) {
        itemDAO.deletarItem(id);
    }
}
