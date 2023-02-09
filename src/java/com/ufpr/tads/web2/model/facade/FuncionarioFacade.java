package com.ufpr.tads.web2.model.facade;

import com.ufpr.tads.web2.model.domain.Funcionario;
import com.ufpr.tads.web2.model.dao.FuncionarioDAO;

public class FuncionarioFacade {
    private FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    
    public void cadastrarFuncionario(Funcionario funcionario) {
        Funcionario funcionario = new Funcionario();
        funcionario.setNomeUser(request.getParameter("nomeUser"));
        funcionario.setDataNascimento(request.getParameter("dataNascimento"))
        funcionario.setEmailUser(request.getParameter("emailUser"));
        funcionario.setSenhaUser(request.getParameter("senhaUser"));
        return funcionarioDAO.inserir(funcionario);
    }
    
    public List<Funcionario> listarFuncionarios() {
        request.setAttribute("funcionarios", funcionarios);
        return funcionarioDAO.listar();
    }
    
    public Funcionario buscarFuncionarioPorId(int idUser) {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        Funcionario funcionario = funcionarioDAO.consultar(idUser);
        return funcionarioDAO.buscarPorId(idUser);
    }
    
    public void atualizarFuncionario(Funcionario funcionario) {
        funcionario = new Funcionario();
        funcionario.setNomeUser(request.getParameter("nomeUser"));
        funcionario.setEmailUser(request.getParameter("emailUser"));
        funcionario.setSenhaUser(request.getParameter("senhaUser"));
        return funcionarioDAO.atualizar(funcionario);
    }
    
    public void excluirFuncionario(int idUser) {
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        funcionarioDAO.excluir(idUser);
    }
}