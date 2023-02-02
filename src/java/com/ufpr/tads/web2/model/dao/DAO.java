package com.ufpr.tads.web2.model.dao;

import java.util.List;
import com.ufpr.tads.web2.exception.DAOException;

public interface DAO<T> {
    T search(String name) throws DAOException;
    T searchById (int id) throws DAOException;
    List<T> searchAll() throws DAOException;
    void insert(T t) throws DAOException;
    void update(T t) throws DAOException;
    void delete(T t) throws DAOException;
}
