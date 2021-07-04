/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.database;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.samith.logging.getLogger;

/**
 *
 * @author UDISSSA1
 */
public class RetrieveData {
    
    public ResultSet getResultsFormDB(String sql) throws Exception{
        ResultSet result = null;
        try {
            result = DBConnection.readConnect().createStatement().executeQuery(sql);
            getLogger.getLog().debug(sql);
        } catch (SQLException e) {
            getLogger.getLog().debug(e.toString());
        }
        return result;
    }
    
}
