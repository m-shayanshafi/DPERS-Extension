package gr.uom.java.pattern.gui.progress;
import java.util.Vector;

import gr.uom.java.pattern.PatternInstance;

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
     }

    public String getPatternName() {
        return patternName;
    }

    public Vector<PatternInstance> getPatternInstanceVector() {
        return patternInstanceVector;
    }

}
