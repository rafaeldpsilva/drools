package org.engcia.cfsample;

//import org.drools.core.rule.builder.dialect.asm.ClassGenerator;
import org.kie.api.KieServices;
//import org.kie.api.event.rule.RuleRuntimeEventListener;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.engcia.cf.listeners.TrackingAgendaListener;
import org.engcia.cf.model.Hypothesis;
import org.engcia.cf.model.Evidence;
import org.engcia.cf.listeners.FactListener;


/**
 * This is a sample class to launch a rule.
 */
public class DroolsTest {

    public static final void main(String[] args) {
        try {
            // load up the knowledge base
	        KieServices ks = KieServices.Factory.get();
    	    KieContainer kContainer = ks.getKieClasspathContainer();
        	KieSession kSession = kContainer.newKieSession("ksession-rules");
        	
        	// Agenda listener
        	kSession.addEventListener(new TrackingAgendaListener());
        	
        	// Facts listener
        	kSession.addEventListener(new FactListener());

            // go !
            
            kSession.insert(new Hypothesis(0.0, "guilty", "true"));
            kSession.insert(new Evidence(0.90, "fingerprints", "true"));
            kSession.insert(new Evidence(0.50, "motive", "true"));
            kSession.insert(new Evidence(0.95, "alibi", "true"));
            
            kSession.fireAllRules();
            
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }

}
