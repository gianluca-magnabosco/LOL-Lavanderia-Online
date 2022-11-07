package dao;

import java.util.List;
import exception.DAOException;

public interface DAO<T> {
    T searchOne(int id) throws DAOException;
    List<T> searchAll() throws DAOException;
    void insert(T t) throws DAOException;
    void update(int id, T newT) throws DAOException;
    void delete(T t) throws DAOException;
}
