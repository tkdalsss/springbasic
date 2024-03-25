package com.hana.app.frame;

import com.hana.exception.DuplicatedException;

import java.util.List;

public interface Dao<K, V> {
    int insert(V v) throws DuplicatedException;
    int delete(K k) throws Exception;
    int update(V v) throws Exception;
    V select(K k) throws Exception;
    List<V> select() throws Exception;
}
