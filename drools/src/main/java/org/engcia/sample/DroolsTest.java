package org.engcia.sample;

//import org.drools.core.rule.builder.dialect.asm.ClassGenerator;

import org.engcia.fuzzy.FuzzyLogic;
import org.engcia.model.*;
import org.engcia.view.UI;
import org.kie.api.KieServices;
import org.kie.api.runtime.KieContainer;
import org.kie.api.runtime.KieSession;
import org.kie.api.runtime.rule.LiveQuery;
import org.kie.api.runtime.rule.Row;
import org.kie.api.runtime.rule.ViewChangedEventListener;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;


/**
 * This is a sample class to launch a rule.
 */
public class DroolsTest {
    public static KieSession KS;
    public static BufferedReader BR;
    public static TrackingAgendaEventListener agendaEventListener;
    public static Map<Integer, Justification> justifications;

    public static final void main(String[] args) {
        UI.uiInit();
        runEngine();
        UI.uiClose();
    }

    private static void bootstrap(KieSession kieSession) {
        ArrayList<Device> devices = new ArrayList<>();

        Device kettle = new Device("kettle", 15, false, false);
        devices.add(kettle);
        Device washingMachine = new Device("washing machine", 15, false, true);
        devices.add(washingMachine);
        Device fridge = new Device("fridge", 30, true, true);
        devices.add(fridge);
        Device ac = new Device("ac", 40, true, true);
        devices.add(ac);
        Device aird = new Device("aird", 15, false, false);
        devices.add(aird);

        Participant participant = new Participant("1",100,devices);
        kieSession.setGlobal("participantId", participant.getId());

        int threshold = FuzzyLogic.fuzzify(12,300);
        Battery ev = new Battery(50,10,threshold);

        Pricing p = new Pricing(1000.0);

        kieSession.insert(participant);
        kieSession.insert(ev);
        kieSession.insert(p);
    }

    private static void runEngine() {
        try {

            DroolsTest.justifications = new TreeMap<Integer, Justification>();

            // load up the knowledge base
            KieServices ks = KieServices.Factory.get();
            KieContainer kContainer = ks.getKieClasspathContainer();
            final KieSession kSession = kContainer.newKieSession("community-rules");
            DroolsTest.KS = kSession;
            DroolsTest.agendaEventListener = new TrackingAgendaEventListener();
            kSession.addEventListener(agendaEventListener);

            // Query listener
            ViewChangedEventListener listener = new ViewChangedEventListener() {
                @Override
                public void rowDeleted(Row row) {
                }

                @Override
                public void rowInserted(Row row) {
                    Conclusion conclusion = (Conclusion) row.get("$conclusion");
                    System.out.println(">>>" + conclusion.toString());

                    //System.out.println(DroolsTest.justifications);
                    How how = new How(DroolsTest.justifications);
                    System.out.println(how.getHowExplanation(conclusion.getId()));

                    // stop inference engine after as soon as got a conclusion
                    kSession.halt();

                }

                @Override
                public void rowUpdated(Row row) {
                }

            };

            LiveQuery query = kSession.openLiveQuery("Conclusions", null, listener);

            bootstrap(kSession);

            kSession.fireAllRules();
            kSession.dispose();
            // kSession.fireUntilHalt();

            query.close();

        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
}
