package com.ufpr.tads.web2.model.facade;

import java.util.ArrayList;
import java.util.List;
import com.ufpr.tads.web2.model.domain.Item;
import com.ufpr.tads.web2.dao.RoupaDAO;

public class RoupaFacade {
    private RoupaDAO roupaDAO = new RoupaDAO();

    public List<Item> listarRoupas() {
        return roupaDAO.listarRoupas();
    }

    public void inserirRoupa(Item roupa) {
        roupaDAO.inserirRoupa(roupa);
    }

    public void atualizarRoupa(Item roupa) {
        roupaDAO.atualizarRoupa(roupa);
    }

    public void deletarRoupa(int id) {
        roupaDAO.deletarRoupa(id);
    }
}
