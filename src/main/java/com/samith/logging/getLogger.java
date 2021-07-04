/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.samith.logging;

import org.apache.log4j.Logger;

/**
 *
 * @author UDISSSA1
 */
public class getLogger {
    
    private static final Logger log = Logger.getLogger("confLogger");

    public static Logger getLog() {
        return log;
    }
    
}
