/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.database;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.sqlite.SQLiteConfig;
import com.samith.configs.VariableStorage;
import com.samith.logging.getLogger;

/**
 *
 * @author UDISSSA1
 */
public class DBConnection {
    public static Connection connection;
    
    public static Connection connect() throws Exception{
        //com.samith.controller.FileEncryptor.decryptFile();
        
        Class.forName("org.sqlite.JDBC");
        connection = DriverManager.getConnection("jdbc:sqlite:C:\\My\\db\\Officers.db");
        return connection;
    }

    public static void disconnect() throws Exception{
        connection.close();
        //com.samith.controller.FileEncryptor.encryptFile();
    }
    
    public static Connection readConnect() throws SQLException, GeneralSecurityException, IOException, ClassNotFoundException{
        SQLiteConfig config = new SQLiteConfig();
        config.setReadOnly(true);
        
        //com.samith.controller.FileEncryptor.decryptFile();
        
        Class.forName("org.sqlite.JDBC");
        connection = DriverManager.getConnection("jdbc:sqlite:C:\\My\\db\\Officers.db",config.toProperties());
        return connection;
    }    
}