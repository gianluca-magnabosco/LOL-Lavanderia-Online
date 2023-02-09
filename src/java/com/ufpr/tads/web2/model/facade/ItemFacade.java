package com.ufpr.tads.web2.model.facade;

import java.util.ArrayList;
import java.util.List;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.dao.ItemDAO;

public class ItemFacade {
    private ItemDAO ItemDAO = new ItemDAO();

    public List<Item> listarItems() {
        return ItemDAO.listarItems();
    }

    public void inserirItem(Item Item) {
        ItemDAO.inserirItem(Item);
    }

    public void atualizarItem(Item Item) {
        ItemDAO.atualizarItem(Item);
    }

    public void deletarItem(int id) {
        ItemDAO.deletarItem(id);
    }
}
