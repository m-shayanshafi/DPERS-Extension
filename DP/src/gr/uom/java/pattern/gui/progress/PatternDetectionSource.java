package gr.uom.java.pattern.gui.progress;

import gr.uom.java.bytecode.SystemObject;
import gr.uom.java.pattern.PatternInstance;

import java.io.BufferedWriter;
import java.io.Console;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Wrapper;
import java.util.Vector;
import java.util.logging.ConsoleHandler;

public class PatternDetectionSource {

    private String patternName;
    private Vector<PatternInstance> patternInstanceVector;
    private PopulateDBWithPatterns DBobj;
    public PatternDetectionSource(String patternName, Vector<PatternInstance> patternInstanceVector) throws Throwable {
        this.patternName = patternName;
        this.patternInstanceVector = patternInstanceVector;
        this.DBobj = new PopulateDBWithPatterns();
        DBobj.patternName = patternName;
        DBobj.patternInstanceVector = patternInstanceVector;
        DBobj.populatePatternInstance(DBobj);
        DBobj.closeConnection(); 
        System.out.print(patternName);
    	System.out.print(patternInstanceVector+"\n");
    }

    public String getPatternName() {
        return patternName;
    }

    public Vector<PatternInstance> getPatternInstanceVector() {
        return patternInstanceVector;
    }

}
