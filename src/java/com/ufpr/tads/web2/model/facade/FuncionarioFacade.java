package com.ufpr.tads.web2.model.facade;
import java.util.ArrayList;
import java.util.List;

public class FuncionarioFacade {
    private static List<User> funcionarios = new ArrayList<>();
    
    public static void cadastrarFuncionario(User funcionario) {
        // Adiciona o funcionário na lista de funcionários
        funcionarios.add(funcionario);
    }
    
    public static List<User> listarFuncionarios() {
        // Código para listar funcionários
        // ...
        return funcionarios;
    }
}